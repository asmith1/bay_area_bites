defmodule BayAreaBitesWeb.FoodTruckControllerTest do
  use BayAreaBitesWeb.ConnCase

  import BayAreaBites.SchemaFixtures

  @create_attrs %{
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
  @update_attrs %{
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

  describe "index" do
    test "lists all food_trucks", %{conn: conn} do
      conn = get(conn, ~p"/food_trucks")
      assert html_response(conn, 200) =~ "Listing Food trucks"
    end
  end

  describe "new food_truck" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/food_trucks/new")
      assert html_response(conn, 200) =~ "New Food truck"
    end
  end

  describe "create food_truck" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/food_trucks", food_truck: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/food_trucks/#{id}"

      conn = get(conn, ~p"/food_trucks/#{id}")
      assert html_response(conn, 200) =~ "Food truck #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/food_trucks", food_truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Food truck"
    end
  end

  describe "edit food_truck" do
    setup [:create_food_truck]

    test "renders form for editing chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = get(conn, ~p"/food_trucks/#{food_truck}/edit")
      assert html_response(conn, 200) =~ "Edit Food truck"
    end
  end

  describe "update food_truck" do
    setup [:create_food_truck]

    test "redirects when data is valid", %{conn: conn, food_truck: food_truck} do
      conn = put(conn, ~p"/food_trucks/#{food_truck}", food_truck: @update_attrs)
      assert redirected_to(conn) == ~p"/food_trucks/#{food_truck}"

      conn = get(conn, ~p"/food_trucks/#{food_truck}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, food_truck: food_truck} do
      conn = put(conn, ~p"/food_trucks/#{food_truck}", food_truck: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Food truck"
    end
  end

  describe "delete food_truck" do
    setup [:create_food_truck]

    test "deletes chosen food_truck", %{conn: conn, food_truck: food_truck} do
      conn = delete(conn, ~p"/food_trucks/#{food_truck}")
      assert redirected_to(conn) == ~p"/food_trucks"

      assert_error_sent 404, fn ->
        get(conn, ~p"/food_trucks/#{food_truck}")
      end
    end
  end

  defp create_food_truck(_) do
    food_truck = food_truck_fixture()
    %{food_truck: food_truck}
  end
end
