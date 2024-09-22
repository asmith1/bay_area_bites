defmodule BayAreaBitesWeb.FoodItemControllerTest do
  use BayAreaBitesWeb.ConnCase

  import BayAreaBites.SchemaFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all food_items", %{conn: conn} do
      conn = get(conn, ~p"/food_items")
      assert html_response(conn, 200) =~ "Listing Food items"
    end
  end

  describe "new food_items" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/food_items/new")
      assert html_response(conn, 200) =~ "New Food items"
    end
  end

  describe "create food_items" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/food_items", food_items: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/food_items/#{id}"

      conn = get(conn, ~p"/food_items/#{id}")
      assert html_response(conn, 200) =~ "Food items #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/food_items", food_items: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food items"
    end
  end

  describe "edit food_items" do
    setup [:create_food_items]

    test "renders form for editing chosen food_items", %{conn: conn, food_items: food_items} do
      conn = get(conn, ~p"/food_items/#{food_items}/edit")
      assert html_response(conn, 200) =~ "Edit Food items"
    end
  end

  describe "update food_items" do
    setup [:create_food_items]

    test "redirects when data is valid", %{conn: conn, food_items: food_items} do
      conn = put(conn, ~p"/food_items/#{food_items}", food_items: @update_attrs)
      assert redirected_to(conn) == ~p"/food_items/#{food_items}"

      conn = get(conn, ~p"/food_items/#{food_items}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, food_items: food_items} do
      conn = put(conn, ~p"/food_items/#{food_items}", food_items: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Food items"
    end
  end

  describe "delete food_items" do
    setup [:create_food_items]

    test "deletes chosen food_items", %{conn: conn, food_items: food_items} do
      conn = delete(conn, ~p"/food_items/#{food_items}")
      assert redirected_to(conn) == ~p"/food_items"

      assert_error_sent 404, fn ->
        get(conn, ~p"/food_items/#{food_items}")
      end
    end
  end

  defp create_food_items(_) do
    food_items = food_items_fixture()
    %{food_items: food_items}
  end
end
