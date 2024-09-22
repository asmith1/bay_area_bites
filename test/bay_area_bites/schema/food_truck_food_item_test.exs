defmodule BayAreaBites.Schema.FoodTruckFoodItemTest do
  use BayAreaBites.DataCase

  alias BayAreaBites.Schema.FoodTruckFoodItem

  describe "food_truck_food_items" do
    import BayAreaBites.SchemaFixtures

    @invalid_attrs %{food_truck_id: nil, food_item_id: nil}

    test "list_food_truck_food_items/0 returns all food_truck_food_items" do
      food_truck_food_item = food_truck_food_item_fixture()
      assert Schema.list_food_truck_food_items() == [food_truck_food_item]
    end

    test "get_food_truck_food_item!/1 returns the food_truck_food_item with given id" do
      food_truck_food_item = food_truck_food_item_fixture()
      assert Schema.get_food_truck_food_item!(food_truck_food_item.id) == food_truck_food_item
    end

    test "create_food_truck_food_item/1 with valid data creates a food_truck_food_item" do
      valid_attrs = %{food_truck_id: 42, food_item_id: 42}

      assert {:ok, %FoodTruckFoodItem{} = food_truck_food_item} =
               Schema.create_food_truck_food_item(valid_attrs)

      assert food_truck_food_item.food_truck_id == 42
      assert food_truck_food_item.food_item_id == 42
    end

    test "create_food_truck_food_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schema.create_food_truck_food_item(@invalid_attrs)
    end

    test "update_food_truck_food_item/2 with valid data updates the food_truck_food_item" do
      food_truck_food_item = food_truck_food_item_fixture()
      update_attrs = %{food_truck_id: 43, food_item_id: 43}

      assert {:ok, %FoodTruckFoodItem{} = food_truck_food_item} =
               Schema.update_food_truck_food_item(food_truck_food_item, update_attrs)

      assert food_truck_food_item.food_truck_id == 43
      assert food_truck_food_item.food_item_id == 43
    end

    test "update_food_truck_food_item/2 with invalid data returns error changeset" do
      food_truck_food_item = food_truck_food_item_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Schema.update_food_truck_food_item(food_truck_food_item, @invalid_attrs)

      assert food_truck_food_item == Schema.get_food_truck_food_item!(food_truck_food_item.id)
    end

    test "delete_food_truck_food_item/1 deletes the food_truck_food_item" do
      food_truck_food_item = food_truck_food_item_fixture()

      assert {:ok, %FoodTruckFoodItem{}} =
               Schema.delete_food_truck_food_item(food_truck_food_item)

      assert_raise Ecto.NoResultsError, fn ->
        Schema.get_food_truck_food_item!(food_truck_food_item.id)
      end
    end

    test "change_food_truck_food_item/1 returns a food_truck_food_item changeset" do
      food_truck_food_item = food_truck_food_item_fixture()
      assert %Ecto.Changeset{} = Schema.change_food_truck_food_item(food_truck_food_item)
    end
  end
end
