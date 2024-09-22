defmodule BayAreaBites.Repo.Migrations.CreateFoodItem do
  use Ecto.Migration

  def change do
    create table(:food_items) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
