defmodule BayAreaBites.Schema.FoodItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "food_items" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(food_items, attrs) do
    food_items
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
