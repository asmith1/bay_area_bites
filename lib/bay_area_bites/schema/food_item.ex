defmodule BayAreaBites.Schema.FoodItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_items" do
    field :name, :string
    has_many :food_truck_food_items, FoodTruckFoodItem

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_items, attrs) do
    food_items
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name, name: :food_item_name_unique_index)
  end
end
