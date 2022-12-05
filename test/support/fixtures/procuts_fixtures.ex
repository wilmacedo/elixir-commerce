defmodule Comercio.ProcutsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Comercio.Procuts` context.
  """

  @doc """
  Generate a food.
  """
  def food_fixture(attrs \\ %{}) do
    {:ok, food} =
      attrs
      |> Enum.into(%{
        category: "some category",
        img: "some img",
        name: "some name",
        price: "120.5"
      })
      |> Comercio.Procuts.create_food()

    food
  end
end
