# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BayAreaBites.Repo.insert!(%BayAreaBites.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Scripts.ImportDataFromCsv do
  alias NimbleCSV.RFC4180, as: CsvParser
  alias BayAreaBites.Repo
  alias BayAreaBites.App.FoodTruck

  # i arrived at this number by spot checking some of the data where we see long food item names and
  # some garbage data and 50 seemed like a reasonable number within those bounds
  @food_item_char_limit 50

  def run() do
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
      Repo.insert!(%FoodTruck{
        location_id: String.to_integer(location_id),
        name: :binary.copy(applicant),
        facility_type: :binary.copy(facility_type),
        location_description: :binary.copy(location_description),
        address: :binary.copy(address),
        status: :binary.copy(status),
        x_coordinate:
          if !is_nil(x) and x != 0 do
            String.to_float(x)
          end,
        y_coordinate:
          if !is_nil(y) and y != 0 do
            String.to_float(y)
          end,
        latitude:
          if !is_nil(latitude) and latitude != 0 do
            String.to_float(latitude)
          end,
        longitude:
          if !is_nil(longitude) and longitude != 0 do
            String.to_float(longitude)
          end,
        link_to_schedule_pdf: :binary.copy(schedule),
        schedule_description: :binary.copy(days_hours)
      })

      parse_food_items(food_items)
    end)
    |> Stream.run()
  end

  defp parse_food_items(food_items) do
    food_items
    |> String.split(~r/cold truck[:.]?/i)
    |> Enum.reject(fn item -> Regex.match?(~r/cold truck[:.]?/i, item) end)
    |> Enum.reverse()
    |> Enum.at(0)
    |> String.split(":", trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(fn item -> String.length(item) > @food_item_char_limit end)
    |> Enum.map(&String.downcase/1)
    |> IO.inspect()

    # TODO: add food items to db

    # with more time i would have correctly handled parentheses - when a colon is inside of a set of parentheses it's ignored
    # an even better implementation would have metadata on the food and enable the food item to be pizza e.g. and have different types
    # which are the options within the parentheses that we see in much of the data
  end
end
