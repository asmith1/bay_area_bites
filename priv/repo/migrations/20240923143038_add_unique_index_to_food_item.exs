defmodule BayAreaBites.Repo.Migrations.AddUniqueIndexToFoodItem do
  use Ecto.Migration

  def change do
    create unique_index(
             :food_items,
             :name,
             name: :food_item_name_unique_index
           )
  end
end
