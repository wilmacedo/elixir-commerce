defmodule ComercioWeb.UsersController do
  use ComercioWeb, :controller

  alias Comercio.Accounts
  alias Comercio.Accounts.Users

  def new(conn, _params) do
    changeset = Accounts.change_users(%Users{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"users" => users_params}) do
    case Accounts.create_users(users_params) do
      {:ok, users} ->
        conn
        |> put_session(:current_user_name, users.name)
        |> put_flash(:info, "Users created successfully.")
        |> redirect(to: Routes.users_path(conn, :show, users))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
