defmodule PhoenixApiBoilerplateWeb.OrderController do
  use PhoenixApiBoilerplateWeb, :controller

  alias PhoenixApiBoilerplate.V1
  alias PhoenixApiBoilerplate.V1.Order

  action_fallback PhoenixApiBoilerplateWeb.FallbackController

  def index(conn, _params) do
    orders = V1.list_orders()
    render(conn, "index.json", orders: orders)
  end

  def create(conn, %{"order" => order_params}) do
    with {:ok, %Order{} = order} <- V1.create_order(order_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.order_path(conn, :show, order))
      |> render("show.json", order: order)
    end
  end

  def show(conn, %{"id" => id}) do
    order = V1.get_order!(id)
    render(conn, "show.json", order: order)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = V1.get_order!(id)

    with {:ok, %Order{} = order} <- V1.update_order(order, order_params) do
      render(conn, "show.json", order: order)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = V1.get_order!(id)

    with {:ok, %Order{}} <- V1.delete_order(order) do
      send_resp(conn, :no_content, "")
    end
  end
end
