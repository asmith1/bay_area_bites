defmodule BayAreaBitesWeb.FoodTruckFoodItemController do
  use BayAreaBitesWeb, :controller

  alias BayAreaBites.Schema
  alias BayAreaBites.Schema.FoodTruckFoodItem

  def index(conn, _params) do
    food_truck_food_items = Schema.list_food_truck_food_items()
    render(conn, :index, food_truck_food_items: food_truck_food_items)
  end

  def new(conn, _params) do
    changeset = Schema.change_food_truck_food_item(%FoodTruckFoodItem{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"food_truck_food_item" => food_truck_food_item_params}) do
    case Schema.create_food_truck_food_item(food_truck_food_item_params) do
      {:ok, food_truck_food_item} ->
        conn
        |> put_flash(:info, "Food truck food item created successfully.")
        |> redirect(to: ~p"/food_truck_food_items/#{food_truck_food_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food_truck_food_item = Schema.get_food_truck_food_item!(id)
    render(conn, :show, food_truck_food_item: food_truck_food_item)
  end

  def edit(conn, %{"id" => id}) do
    food_truck_food_item = Schema.get_food_truck_food_item!(id)
    changeset = Schema.change_food_truck_food_item(food_truck_food_item)
    render(conn, :edit, food_truck_food_item: food_truck_food_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food_truck_food_item" => food_truck_food_item_params}) do
    food_truck_food_item = Schema.get_food_truck_food_item!(id)

    case Schema.update_food_truck_food_item(food_truck_food_item, food_truck_food_item_params) do
      {:ok, food_truck_food_item} ->
        conn
        |> put_flash(:info, "Food truck food item updated successfully.")
        |> redirect(to: ~p"/food_truck_food_items/#{food_truck_food_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, food_truck_food_item: food_truck_food_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_truck_food_item = Schema.get_food_truck_food_item!(id)
    {:ok, _food_truck_food_item} = Schema.delete_food_truck_food_item(food_truck_food_item)

    conn
    |> put_flash(:info, "Food truck food item deleted successfully.")
    |> redirect(to: ~p"/food_truck_food_items")
  end
end
