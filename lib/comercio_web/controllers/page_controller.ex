defmodule ComercioWeb.PageController do
  use ComercioWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
