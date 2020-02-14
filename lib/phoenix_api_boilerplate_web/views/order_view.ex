defmodule PhoenixApiBoilerplateWeb.OrderView do
  use PhoenixApiBoilerplateWeb, :view
  alias PhoenixApiBoilerplateWeb.OrderView

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, OrderView, "order.json")}
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, OrderView, "order.json")}
  end

  def render("order.json", %{order: order}) do
    %{id: order.id,
      user_id: order.user_id,
      offer_id: order.offer_id}
  end
end
