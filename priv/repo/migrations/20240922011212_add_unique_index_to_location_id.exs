defmodule BayAreaBites.Repo.Migrations.AddUniqueIndexToLocationId do
  use Ecto.Migration

  def change do
    create unique_index(
             :food_trucks,
             :location_id,
             name: :location_id_unique_index
           )
  end
end
