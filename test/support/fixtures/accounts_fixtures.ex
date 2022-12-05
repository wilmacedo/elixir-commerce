defmodule Comercio.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Comercio.Accounts` context.
  """

  @doc """
  Generate a users.
  """
  def users_fixture(attrs \\ %{}) do
    {:ok, users} =
      attrs
      |> Enum.into(%{
        lastName: "some lastName",
        name: "some name",
        password: "some password"
      })
      |> Comercio.Accounts.create_users()

    users
  end
end
