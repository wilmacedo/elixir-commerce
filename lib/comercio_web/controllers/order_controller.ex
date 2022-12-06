defmodule ComercioWeb.OrderController do
  use ComercioWeb, :controller

  alias Comercio.Procuts
  alias Comercio.Orders

  def index(conn, _params) do
    orders = Orders.list_orders()
    products = Procuts.list_foods()
    render(conn, "index.html", orders: orders, products: products)
  end

  def create(conn, %{"id" => product_id}) do
    user_id = get_session(conn, :current_user_id)
    order_params = %{clientId: user_id, status: "Pendente"}
    food = Procuts.get_food!(product_id)

    case Orders.create_order(order_params) do
      {:ok, order} ->
        food_params = %{
          name: food.name,
          category: food.category,
          img: food.img,
          price: food.price,
          order: order.id
        }

        case Procuts.update_food(food, food_params) do
          {:ok, food} ->
            conn
            |> put_flash(:info, food.name <> " adicionado ao pedido!")
            |> redirect(to: Routes.order_path(conn, :index))

          {:error, _} ->
            conn
            |> put_flash(:info, "Erro ao atualizar produto")
        end

      {:error, _} ->
        conn
        |> put_flash(:info, "Erro ao criar pedido")
    end
  end

  def show(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    products = Procuts.list_foods()
    render(conn, "show.html", order: order, products: products)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Orders.get_order!(id)

    case Orders.update_order(order, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", order: order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Orders.get_order!(id)
    {:ok, _order} = Orders.delete_order(order)

    conn
    |> put_flash(:info, "Pedido deletado com sucesso!")
    |> redirect(to: Routes.order_path(conn, :index))
  end
end
