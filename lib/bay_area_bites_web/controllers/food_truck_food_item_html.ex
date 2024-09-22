defmodule BayAreaBitesWeb.FoodTruckFoodItemHTML do
  use BayAreaBitesWeb, :html

  embed_templates "food_truck_food_item_html/*"

  @doc """
  Renders a food_truck_food_item form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def food_truck_food_item_form(assigns)
end
