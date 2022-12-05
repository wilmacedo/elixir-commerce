defmodule Comercio.AccountsTest do
  use Comercio.DataCase

  alias Comercio.Accounts

  describe "accounts" do
    alias Comercio.Accounts.Users

    import Comercio.AccountsFixtures

    @invalid_attrs %{lastName: nil, name: nil, password: nil}

    test "list_accounts/0 returns all accounts" do
      users = users_fixture()
      assert Accounts.list_accounts() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Accounts.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      valid_attrs = %{lastName: "some lastName", name: "some name", password: "some password"}

      assert {:ok, %Users{} = users} = Accounts.create_users(valid_attrs)
      assert users.lastName == "some lastName"
      assert users.name == "some name"
      assert users.password == "some password"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      update_attrs = %{lastName: "some updated lastName", name: "some updated name", password: "some updated password"}

      assert {:ok, %Users{} = users} = Accounts.update_users(users, update_attrs)
      assert users.lastName == "some updated lastName"
      assert users.name == "some updated name"
      assert users.password == "some updated password"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_users(users, @invalid_attrs)
      assert users == Accounts.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Accounts.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Accounts.change_users(users)
    end
  end
end
