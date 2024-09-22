defmodule BayAreaBitesWeb.FoodItemHTML do
  use BayAreaBitesWeb, :html

  embed_templates "food_items_html/*"

  @doc """
  Renders a food_items form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def food_items_form(assigns)
end
