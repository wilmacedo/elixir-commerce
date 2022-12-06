defmodule ComercioWeb.Helpers.Auth do
  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!Comercio.Repo.get(Comercio.Accounts.Users, user_id)
  end

  def user_role?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: Comercio.Repo.get(Comercio.Accounts.Users, user_id).role
  end

  def get_user_name?(conn, user_id) do
    user = Comercio.Repo.get(Comercio.Accounts.Users, user_id)

    if user do
      user.name
    else
      "Usuário não encontrado"
    end
  end
end
