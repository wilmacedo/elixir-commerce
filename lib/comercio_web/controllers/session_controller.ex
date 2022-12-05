defmodule ComercioWeb.SessionController do
  use ComercioWeb, :controller
  alias Comercio.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accounts.get_by_name(auth_params["name"])

    case Comeonin.Bcrypt.check_pass(user, auth_params["password"]) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Logado com sucesso!")
        |> redirect(to: Routes.food_path(conn, :index))

      {:error, _} ->
        conn
        |> put_flash(:error, "Usuário ou senha inválidos")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Deslogado com sucesso!")
    |> redirect(to: Routes.food_path(conn, :index))
  end
end
