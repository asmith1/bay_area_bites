defmodule BayAreaBites.Schema.FoodItemTest do
  use BayAreaBites.DataCase

  alias BayAreaBites.Schema
  alias BayAreaBites.Schema.FoodItem

  describe "food_items" do
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
