defmodule Comercio.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Comercio.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        clientId: 42,
        status: "some status"
      })
      |> Comercio.Orders.create_order()

    order
  end
end
