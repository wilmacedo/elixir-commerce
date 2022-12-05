defmodule ComercioWeb.FoodController do
  use ComercioWeb, :controller

  alias Comercio.Procuts
  alias Comercio.Procuts.Food

  def index(conn, _params) do
    foods = Procuts.list_foods()
    render(conn, "index.html", foods: foods)
  end

  def new(conn, _params) do
    changeset = Procuts.change_food(%Food{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"food" => food_params}) do
    case Procuts.create_food(food_params) do
      {:ok, _food} ->
        conn
        |> put_flash(:info, "Food created successfully.")

      # |> redirect(to: Routes.food_path(conn, :show, food))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    food = Procuts.get_food!(id)
    render(conn, "show.html", food: food)
  end

  def edit(conn, %{"id" => id}) do
    food = Procuts.get_food!(id)
    changeset = Procuts.change_food(food)
    render(conn, "edit.html", food: food, changeset: changeset)
  end

  def update(conn, %{"id" => id, "food" => food_params}) do
    food = Procuts.get_food!(id)

    case Procuts.update_food(food, food_params) do
      {:ok, _food} ->
        conn
        |> put_flash(:info, "Food updated successfully.")

      # |> redirect(to: Routes.food_path(conn, :show, food))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", food: food, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    food = Procuts.get_food!(id)
    {:ok, _food} = Procuts.delete_food(food)

    conn
    |> put_flash(:info, "Food deleted successfully.")

    # |> redirect(to: Routes.food_path(conn, :index))
  end
end
