defmodule BayAreaBites.Schema.FoodTruck do
  alias BayAreaBites.Schema.FoodTruckFoodItem
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_trucks" do
    field :name, :string
    field :status, :string
    field :address, :string
    field :location_id, :integer
    field :facility_type, :string
    field :location_description, :string
    field :x_coordinate, :float
    field :y_coordinate, :float
    field :latitude, :float
    field :longitude, :float
    field :link_to_schedule_pdf, :string
    field :schedule_description, :string
    has_many :food_truck_food_items, FoodTruckFoodItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :location_id,
      :name,
      :facility_type,
      :location_description,
      :address,
      :status,
      :x_coordinate,
      :y_coordinate,
      :latitude,
      :longitude,
      :link_to_schedule_pdf,
      :schedule_description
    ])
    |> validate_required([
      :location_id,
      :name,
      :facility_type,
      :location_description,
      :address,
      :status,
      :x_coordinate,
      :y_coordinate,
      :latitude,
      :longitude,
      :link_to_schedule_pdf,
      :schedule_description
    ])
    |> unique_constraint(:location_id, name: :location_id_unique_index)
  end
end
