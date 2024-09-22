defmodule BayAreaBites.Repo.Migrations.CreateFoodTruckFoodItems do
  use Ecto.Migration

  def change do
    create table(:food_truck_food_items) do
      add :food_truck_id, :integer
      add :food_item_id, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
