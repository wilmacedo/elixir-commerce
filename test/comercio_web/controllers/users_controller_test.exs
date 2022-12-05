defmodule ComercioWeb.UsersControllerTest do
  use ComercioWeb.ConnCase

  import Comercio.AccountsFixtures

  @create_attrs %{lastName: "some lastName", name: "some name", password: "some password"}
  @update_attrs %{lastName: "some updated lastName", name: "some updated name", password: "some updated password"}
  @invalid_attrs %{lastName: nil, name: nil, password: nil}

  describe "index" do
    test "lists all accounts", %{conn: conn} do
      conn = get(conn, Routes.users_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Accounts"
    end
  end

  describe "new users" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.users_path(conn, :new))
      assert html_response(conn, 200) =~ "New Users"
    end
  end

  describe "create users" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.users_path(conn, :create), users: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.users_path(conn, :show, id)

      conn = get(conn, Routes.users_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Users"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.users_path(conn, :create), users: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Users"
    end
  end

  describe "edit users" do
    setup [:create_users]

    test "renders form for editing chosen users", %{conn: conn, users: users} do
      conn = get(conn, Routes.users_path(conn, :edit, users))
      assert html_response(conn, 200) =~ "Edit Users"
    end
  end

  describe "update users" do
    setup [:create_users]

    test "redirects when data is valid", %{conn: conn, users: users} do
      conn = put(conn, Routes.users_path(conn, :update, users), users: @update_attrs)
      assert redirected_to(conn) == Routes.users_path(conn, :show, users)

      conn = get(conn, Routes.users_path(conn, :show, users))
      assert html_response(conn, 200) =~ "some updated lastName"
    end

    test "renders errors when data is invalid", %{conn: conn, users: users} do
      conn = put(conn, Routes.users_path(conn, :update, users), users: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Users"
    end
  end

  describe "delete users" do
    setup [:create_users]

    test "deletes chosen users", %{conn: conn, users: users} do
      conn = delete(conn, Routes.users_path(conn, :delete, users))
      assert redirected_to(conn) == Routes.users_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.users_path(conn, :show, users))
      end
    end
  end

  defp create_users(_) do
    users = users_fixture()
    %{users: users}
  end
end
