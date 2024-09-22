defmodule BayAreaBitesWeb.FoodItemController do
  use BayAreaBitesWeb, :controller

  alias BayAreaBites.Schema
  alias BayAreaBites.Schema.FoodItem

  def index(conn, _params) do
    food_items = Schema.list_food_items()
    render(conn, :index, food_items_collection: food_items)
  end

  def new(conn, _params) do
    changeset = Schema.change_food_items(%FoodItem{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"food_items" => food_items_params}) do
    case Schema.create_food_items(food_items_params) do
      {:ok, food_items} ->
        conn
        |> put_flash(:info, "Food items created successfully.")
        |> redirect(to: ~p"/food_items/#{food_items}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food_items = Schema.get_food_items!(id)
    render(conn, :show, food_items: food_items)
  end

  def edit(conn, %{"id" => id}) do
    food_items = Schema.get_food_items!(id)
    changeset = Schema.change_food_items(food_items)
    render(conn, :edit, food_items: food_items, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food_items" => food_items_params}) do
    food_items = Schema.get_food_items!(id)

    case Schema.update_food_items(food_items, food_items_params) do
      {:ok, food_items} ->
        conn
        |> put_flash(:info, "Food items updated successfully.")
        |> redirect(to: ~p"/food_items/#{food_items}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, food_items: food_items, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food_items = Schema.get_food_items!(id)
    {:ok, _food_items} = Schema.delete_food_items(food_items)

    conn
    |> put_flash(:info, "Food items deleted successfully.")
    |> redirect(to: ~p"/food_items")
  end
end
