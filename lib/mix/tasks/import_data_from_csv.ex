defmodule Mix.Tasks.ImportDataFromCsv do
  @moduledoc """
  Script for updating the database with the contents from the food trucks CSV in the priv folder
  This script can be run by invoking `mix import_data_from_csv` from the console
  The first time this script is run, it will add all of the data to the database. After that,
  it will just add new records to the database.
  """
  alias BayAreaBites.Schema.FoodTruckFoodItem
  alias NimbleCSV.RFC4180, as: CsvParser
  alias BayAreaBites.Repo
  alias BayAreaBites.Schema.FoodTruck
  alias BayAreaBites.Schema.FoodItem
  alias BayAreaBites.Schema.FoodTruckFoodItem

  import Ecto.Query

  use Mix.Task

  # I arrived at this number by spot checking some of the data where we see long food item names and
  # some garbage data and 50 seemed like a reasonable number within those bounds
  @food_item_char_limit 50

  def run(_) do
    Mix.Task.run("app.start")

    (:code.priv_dir(:bay_area_bites) ++ "/food_truck_data.csv")
    |> File.stream!(read_ahead: 100_000)
    |> CsvParser.parse_stream()
    |> Stream.map(fn [
                       location_id,
                       applicant,
                       facility_type,
                       _cnn,
                       location_description,
                       address,
                       _blocklot,
                       _block,
                       _lot,
                       _permit,
                       status,
                       food_items,
                       x,
                       y,
                       latitude,
                       longitude,
                       schedule,
                       days_hours,
                       _noi_sent,
                       _approved,
                       _received,
                       _prior_permit,
                       _expiration_date,
                       _location,
                       _fire_prevention_districts,
                       _police_districts,
                       _supervisor_districts,
                       _zip_codes,
                       _neighborhoods
                     ] ->
      query =
        from(ft in FoodTruck,
          where: ft.location_id == ^location_id
        )

      # TODO: if a record already exists with that location_id, update existing record
      if !Repo.exists?(query) do
        case Repo.insert(%FoodTruck{
               location_id: String.to_integer(location_id),
               name: :binary.copy(applicant),
               facility_type: :binary.copy(facility_type),
               location_description: :binary.copy(location_description),
               address: :binary.copy(address),
               status: :binary.copy(status),
               x_coordinate:
                 if !is_nil(x) and x != 0 and x != "" do
                   String.to_float(x)
                 end,
               y_coordinate:
                 if !is_nil(y) and y != 0 and x != "" do
                   String.to_float(y)
                 end,
               latitude:
                 if !is_nil(latitude) and latitude != 0 and x != "" do
                   String.to_float(latitude)
                 end,
               longitude:
                 if !is_nil(longitude) and longitude != 0 and x != "" do
                   String.to_float(longitude)
                 end,
               link_to_schedule_pdf: :binary.copy(schedule),
               schedule_description: :binary.copy(days_hours)
             }) do
          {:ok, %FoodTruck{id: food_truck_id}} ->
            # TODO: log that we successfully added a new food truck
            parse_food_items(food_items, food_truck_id)

          {:error, _error} ->
            # TODO: log here so we can investigate error
            # return ok so we can continue importing the rest of the data
            :ok
        end
      end
    end)
    |> Stream.run()
  end

  defp parse_food_items(food_items, food_truck_id) do
    food_items
    |> String.split(~r/cold truck[:.]?/i)
    |> Enum.reject(fn item -> Regex.match?(~r/cold truck[:.]?/i, item) end)
    |> Enum.reverse()
    |> Enum.at(0)
    |> String.split(":", trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn item -> String.length(item) > @food_item_char_limit end)
    |> Enum.map(&String.downcase/1)
    |> Enum.map(fn item ->
      case Repo.insert(%FoodItem{name: item}) do
        {:ok, %FoodItem{id: food_item_id}} ->
          # TODO: log that we successfully added a new food item
          Repo.insert!(%FoodTruckFoodItem{
            food_item_id: food_item_id,
            food_truck_id: food_truck_id
          })

        # TODO: log when adding new food truck food items is successful

        {:error, _error} ->
          # TODO: log here so we can investigate error
          # return ok so we can continue importing the rest of the data
          :ok
      end
    end)

    # with more time i would have correctly handled parentheses - when a colon is inside of a set of parentheses it's ignored
    # an even better implementation would have metadata on the food and enable the food item to be pizza e.g. and have different types
    # which are the options within the parentheses that we see in much of the data
  end
end
