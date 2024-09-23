defmodule BayAreaBites.Repo.Migrations.AddUniqueIndexToFoodTruckFoodItem do
  use Ecto.Migration

  def change do
    create unique_index(
             :food_truck_food_items,
             [:food_truck_id, :food_item_id],
             name: :food_truck_food_item_unique_index
           )
  end
end
