defmodule BayAreaBites.Repo.Migrations.CreateFoodTrucks do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add :location_id, :integer
      add :name, :string
      add :facility_type, :string
      add :location_description, :string
      add :address, :string
      add :status, :string
      add :x_coordinate, :float
      add :y_coordinate, :float
      add :latitude, :float
      add :longitude, :float
      add :link_to_schedule_pdf, :string
      add :schedule_description, :string

      timestamps(type: :utc_datetime)
    end
  end
end
