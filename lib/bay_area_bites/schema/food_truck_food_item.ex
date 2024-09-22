defmodule BayAreaBites.Schema.FoodTruckFoodItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_truck_food_items" do
    field :food_truck_id, :integer
    field :food_item_id, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_truck_food_item, attrs) do
    food_truck_food_item
    |> cast(attrs, [:food_truck_id, :food_item_id])
    |> validate_required([:food_truck_id, :food_item_id])
  end
end
