defmodule BayAreaBites.SchemaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BayAreaBites.Schema` context.
  """

  @doc """
  Generate a food_truck.
  """
  def food_truck_fixture(attrs \\ %{}) do
    {:ok, food_truck} =
      attrs
      |> Enum.into(%{
        address: "some address",
        facility_type: "some facility_type",
        latitude: 120.5,
        link_to_schedule_pdf: "some link_to_schedule_pdf",
        location_description: "some location_description",
        location_id: 42,
        longitude: 120.5,
        name: "some name",
        schedule_description: "some schedule_description",
        status: "some status",
        x_coordinate: 120.5,
        y_coordinate: 120.5
      })
      |> BayAreaBites.Schema.create_food_truck()

    food_truck
  end

  @doc """
  Generate a food_items.
  """
  def food_items_fixture(attrs \\ %{}) do
    {:ok, food_items} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> BayAreaBites.Schema.create_food_items()

    food_items
  end

  @doc """
  Generate a food_truck_food_item.
  """
  def food_truck_food_item_fixture(attrs \\ %{}) do
    {:ok, food_truck_food_item} =
      attrs
      |> Enum.into(%{
        food_item_id: 42,
        food_truck_id: 42
      })
      |> BayAreaBites.Schema.create_food_truck_food_item()

    food_truck_food_item
  end
end
