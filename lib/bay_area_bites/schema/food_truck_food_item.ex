defmodule BayAreaBites.Schema.FoodTruckFoodItem do
  alias BayAreaBites.Schema.FoodItem
  alias BayAreaBites.Schema.FoodTruck
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_truck_food_items" do
    belongs_to :food_truck, FoodTruck
    belongs_to :food_item, FoodItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck_food_item, attrs) do
    food_truck_food_item
    |> cast(attrs, [:food_truck_id, :food_item_id])
    |> validate_required([:food_truck_id, :food_item_id])
    |> unique_constraint(:food_item_id, name: :food_truck_food_item_unique_index)
  end
end
