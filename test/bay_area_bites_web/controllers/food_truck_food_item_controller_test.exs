defmodule BayAreaBitesWeb.FoodTruckFoodItemControllerTest do
  use BayAreaBitesWeb.ConnCase

  import BayAreaBites.SchemaFixtures

  @create_attrs %{food_truck_id: 42, food_item_id: 42}
  @update_attrs %{food_truck_id: 43, food_item_id: 43}
  @invalid_attrs %{food_truck_id: nil, food_item_id: nil}

  describe "index" do
    test "lists all food_truck_food_items", %{conn: conn} do
      conn = get(conn, ~p"/food_truck_food_items")
      assert html_response(conn, 200) =~ "Listing Food truck food items"
    end
  end

  describe "new food_truck_food_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/food_truck_food_items/new")
      assert html_response(conn, 200) =~ "New Food truck food item"
    end
  end

  describe "create food_truck_food_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/food_truck_food_items", food_truck_food_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/food_truck_food_items/#{id}"

      conn = get(conn, ~p"/food_truck_food_items/#{id}")
      assert html_response(conn, 200) =~ "Food truck food item #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/food_truck_food_items", food_truck_food_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food truck food item"
    end
  end

  describe "edit food_truck_food_item" do
    setup [:create_food_truck_food_item]

    test "renders form for editing chosen food_truck_food_item", %{
      conn: conn,
      food_truck_food_item: food_truck_food_item
    } do
      conn = get(conn, ~p"/food_truck_food_items/#{food_truck_food_item}/edit")
      assert html_response(conn, 200) =~ "Edit Food truck food item"
    end
  end

  describe "update food_truck_food_item" do
    setup [:create_food_truck_food_item]

    test "redirects when data is valid", %{conn: conn, food_truck_food_item: food_truck_food_item} do
      conn =
        put(conn, ~p"/food_truck_food_items/#{food_truck_food_item}",
          food_truck_food_item: @update_attrs
        )

      assert redirected_to(conn) == ~p"/food_truck_food_items/#{food_truck_food_item}"

      conn = get(conn, ~p"/food_truck_food_items/#{food_truck_food_item}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      food_truck_food_item: food_truck_food_item
    } do
      conn =
        put(conn, ~p"/food_truck_food_items/#{food_truck_food_item}",
          food_truck_food_item: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Food truck food item"
    end
  end

  describe "delete food_truck_food_item" do
    setup [:create_food_truck_food_item]

    test "deletes chosen food_truck_food_item", %{
      conn: conn,
      food_truck_food_item: food_truck_food_item
    } do
      conn = delete(conn, ~p"/food_truck_food_items/#{food_truck_food_item}")
      assert redirected_to(conn) == ~p"/food_truck_food_items"

      assert_error_sent 404, fn ->
        get(conn, ~p"/food_truck_food_items/#{food_truck_food_item}")
      end
    end
  end

  defp create_food_truck_food_item(_) do
    food_truck_food_item = food_truck_food_item_fixture()
    %{food_truck_food_item: food_truck_food_item}
  end
end
