defmodule BayAreaBites.Schema do
  @moduledoc """
  The Schema context.
  """

  import Ecto.Query, warn: false
  alias BayAreaBites.Repo

  alias BayAreaBites.Schema.FoodTruck

  @doc """
  Returns the list of food_trucks.

  ## Examples

      iex> list_food_trucks()
      [%FoodTruck{}, ...]

  """
  def list_food_trucks do
    Repo.all(FoodTruck)
  end

  @doc """
  Gets a single food_truck.

  Raises `Ecto.NoResultsError` if the Food truck does not exist.

  ## Examples

      iex> get_food_truck!(123)
      %FoodTruck{}

      iex> get_food_truck!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_truck!(id), do: Repo.get!(FoodTruck, id)

  @doc """
  Creates a food_truck.

  ## Examples

      iex> create_food_truck(%{field: value})
      {:ok, %FoodTruck{}}

      iex> create_food_truck(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_truck(attrs \\ %{}) do
    %FoodTruck{}
    |> FoodTruck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_truck.

  ## Examples

      iex> update_food_truck(food_truck, %{field: new_value})
      {:ok, %FoodTruck{}}

      iex> update_food_truck(food_truck, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_truck(%FoodTruck{} = food_truck, attrs) do
    food_truck
    |> FoodTruck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_truck.

  ## Examples

      iex> delete_food_truck(food_truck)
      {:ok, %FoodTruck{}}

      iex> delete_food_truck(food_truck)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_truck(%FoodTruck{} = food_truck) do
    Repo.delete(food_truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_truck changes.

  ## Examples

      iex> change_food_truck(food_truck)
      %Ecto.Changeset{data: %FoodTruck{}}

  """
  def change_food_truck(%FoodTruck{} = food_truck, attrs \\ %{}) do
    FoodTruck.changeset(food_truck, attrs)
  end

  alias BayAreaBites.Schema.FoodItem

  @doc """
  Returns the list of food_items.

  ## Examples

      iex> list_food_items()
      [%FoodItem{}, ...]

  """
  def list_food_items do
    Repo.all(FoodItem)
  end

  @doc """
  Gets a single food_items.

  Raises `Ecto.NoResultsError` if the Food items does not exist.

  ## Examples

      iex> get_food_items!(123)
      %FoodItem{}

      iex> get_food_items!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_items!(id), do: Repo.get!(FoodItem, id)

  @doc """
  Creates a food_items.

  ## Examples

      iex> create_food_items(%{field: value})
      {:ok, %FoodItem{}}

      iex> create_food_items(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_items(attrs \\ %{}) do
    %FoodItem{}
    |> FoodItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_items.

  ## Examples

      iex> update_food_items(food_items, %{field: new_value})
      {:ok, %FoodItem{}}

      iex> update_food_items(food_items, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_items(%FoodItem{} = food_items, attrs) do
    food_items
    |> FoodItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_items.

  ## Examples

      iex> delete_food_items(food_items)
      {:ok, %FoodItem{}}

      iex> delete_food_items(food_items)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_items(%FoodItem{} = food_items) do
    Repo.delete(food_items)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_items changes.

  ## Examples

      iex> change_food_items(food_items)
      %Ecto.Changeset{data: %FoodItem{}}

  """
  def change_food_items(%FoodItem{} = food_items, attrs \\ %{}) do
    FoodItem.changeset(food_items, attrs)
  end

  alias BayAreaBites.Schema.FoodTruckFoodItem

  @doc """
  Returns the list of food_truck_food_items.

  ## Examples

      iex> list_food_truck_food_items()
      [%FoodTruckFoodItem{}, ...]

  """
  def list_food_truck_food_items do
    Repo.all(FoodTruckFoodItem)
  end

  @doc """
  Gets a single food_truck_food_item.

  Raises `Ecto.NoResultsError` if the Food truck food item does not exist.

  ## Examples

      iex> get_food_truck_food_item!(123)
      %FoodTruckFoodItem{}

      iex> get_food_truck_food_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_food_truck_food_item!(id), do: Repo.get!(FoodTruckFoodItem, id)

  @doc """
  Creates a food_truck_food_item.

  ## Examples

      iex> create_food_truck_food_item(%{field: value})
      {:ok, %FoodTruckFoodItem{}}

      iex> create_food_truck_food_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_food_truck_food_item(attrs \\ %{}) do
    %FoodTruckFoodItem{}
    |> FoodTruckFoodItem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a food_truck_food_item.

  ## Examples

      iex> update_food_truck_food_item(food_truck_food_item, %{field: new_value})
      {:ok, %FoodTruckFoodItem{}}

      iex> update_food_truck_food_item(food_truck_food_item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_food_truck_food_item(%FoodTruckFoodItem{} = food_truck_food_item, attrs) do
    food_truck_food_item
    |> FoodTruckFoodItem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a food_truck_food_item.

  ## Examples

      iex> delete_food_truck_food_item(food_truck_food_item)
      {:ok, %FoodTruckFoodItem{}}

      iex> delete_food_truck_food_item(food_truck_food_item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_food_truck_food_item(%FoodTruckFoodItem{} = food_truck_food_item) do
    Repo.delete(food_truck_food_item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking food_truck_food_item changes.

  ## Examples

      iex> change_food_truck_food_item(food_truck_food_item)
      %Ecto.Changeset{data: %FoodTruckFoodItem{}}

  """
  def change_food_truck_food_item(%FoodTruckFoodItem{} = food_truck_food_item, attrs \\ %{}) do
    FoodTruckFoodItem.changeset(food_truck_food_item, attrs)
  end
end
