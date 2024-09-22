defmodule BayAreaBites.SchemaTest do
  use BayAreaBites.DataCase

  alias BayAreaBites.Schema

  describe "food_trucks" do
    alias BayAreaBites.Schema.FoodTruck

    import BayAreaBites.SchemaFixtures

    @invalid_attrs %{
      name: nil,
      status: nil,
      address: nil,
      location_id: nil,
      facility_type: nil,
      location_description: nil,
      x_coordinate: nil,
      y_coordinate: nil,
      latitude: nil,
      longitude: nil,
      link_to_schedule_pdf: nil,
      schedule_description: nil
    }

    test "list_food_trucks/0 returns all food_trucks" do
      food_truck = food_truck_fixture()
      assert Schema.list_food_trucks() == [food_truck]
    end

    test "get_food_truck!/1 returns the food_truck with given id" do
      food_truck = food_truck_fixture()
      assert Schema.get_food_truck!(food_truck.id) == food_truck
    end

    test "create_food_truck/1 with valid data creates a food_truck" do
      valid_attrs = %{
        name: "some name",
        status: "some status",
        address: "some address",
        location_id: 42,
        facility_type: "some facility_type",
        location_description: "some location_description",
        x_coordinate: 120.5,
        y_coordinate: 120.5,
        latitude: 120.5,
        longitude: 120.5,
        link_to_schedule_pdf: "some link_to_schedule_pdf",
        schedule_description: "some schedule_description"
      }

      assert {:ok, %FoodTruck{} = food_truck} = Schema.create_food_truck(valid_attrs)
      assert food_truck.name == "some name"
      assert food_truck.status == "some status"
      assert food_truck.address == "some address"
      assert food_truck.location_id == 42
      assert food_truck.facility_type == "some facility_type"
      assert food_truck.location_description == "some location_description"
      assert food_truck.x_coordinate == 120.5
      assert food_truck.y_coordinate == 120.5
      assert food_truck.latitude == 120.5
      assert food_truck.longitude == 120.5
      assert food_truck.link_to_schedule_pdf == "some link_to_schedule_pdf"
      assert food_truck.schedule_description == "some schedule_description"
    end

    test "create_food_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_food_truck(@invalid_attrs)
    end

    test "update_food_truck/2 with valid data updates the food_truck" do
      food_truck = food_truck_fixture()

      update_attrs = %{
        name: "some updated name",
        status: "some updated status",
        address: "some updated address",
        location_id: 43,
        facility_type: "some updated facility_type",
        location_description: "some updated location_description",
        x_coordinate: 456.7,
        y_coordinate: 456.7,
        latitude: 456.7,
        longitude: 456.7,
        link_to_schedule_pdf: "some updated link_to_schedule_pdf",
        schedule_description: "some updated schedule_description"
      }

      assert {:ok, %FoodTruck{} = food_truck} = Schema.update_food_truck(food_truck, update_attrs)
      assert food_truck.name == "some updated name"
      assert food_truck.status == "some updated status"
      assert food_truck.address == "some updated address"
      assert food_truck.location_id == 43
      assert food_truck.facility_type == "some updated facility_type"
      assert food_truck.location_description == "some updated location_description"
      assert food_truck.x_coordinate == 456.7
      assert food_truck.y_coordinate == 456.7
      assert food_truck.latitude == 456.7
      assert food_truck.longitude == 456.7
      assert food_truck.link_to_schedule_pdf == "some updated link_to_schedule_pdf"
      assert food_truck.schedule_description == "some updated schedule_description"
    end

    test "update_food_truck/2 with invalid data returns error changeset" do
      food_truck = food_truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_food_truck(food_truck, @invalid_attrs)
      assert food_truck == Schema.get_food_truck!(food_truck.id)
    end

    test "delete_food_truck/1 deletes the food_truck" do
      food_truck = food_truck_fixture()
      assert {:ok, %FoodTruck{}} = Schema.delete_food_truck(food_truck)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_food_truck!(food_truck.id) end
    end

    test "change_food_truck/1 returns a food_truck changeset" do
      food_truck = food_truck_fixture()
      assert %Ecto.Changeset{} = Schema.change_food_truck(food_truck)
    end
  end

  describe "food_items" do
    alias BayAreaBites.Schema.FoodItem

    import BayAreaBites.SchemaFixtures

    @invalid_attrs %{name: nil}

    test "list_food_items/0 returns all food_items" do
      food_items = food_items_fixture()
      assert Schema.list_food_items() == [food_items]
    end

    test "get_food_items!/1 returns the food_items with given id" do
      food_items = food_items_fixture()
      assert Schema.get_food_items!(food_items.id) == food_items
    end

    test "create_food_items/1 with valid data creates a food_items" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %FoodItem{} = food_items} = Schema.create_food_items(valid_attrs)
      assert food_items.name == "some name"
    end

    test "create_food_items/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_food_items(@invalid_attrs)
    end

    test "update_food_items/2 with valid data updates the food_items" do
      food_items = food_items_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %FoodItem{} = food_items} = Schema.update_food_items(food_items, update_attrs)
      assert food_items.name == "some updated name"
    end

    test "update_food_items/2 with invalid data returns error changeset" do
      food_items = food_items_fixture()
      assert {:error, %Ecto.Changeset{}} = Schema.update_food_items(food_items, @invalid_attrs)
      assert food_items == Schema.get_food_items!(food_items.id)
    end

    test "delete_food_items/1 deletes the food_items" do
      food_items = food_items_fixture()
      assert {:ok, %FoodItem{}} = Schema.delete_food_items(food_items)
      assert_raise Ecto.NoResultsError, fn -> Schema.get_food_items!(food_items.id) end
    end

    test "change_food_items/1 returns a food_items changeset" do
      food_items = food_items_fixture()
      assert %Ecto.Changeset{} = Schema.change_food_items(food_items)
    end
  end
end
