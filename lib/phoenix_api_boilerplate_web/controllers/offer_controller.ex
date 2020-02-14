defmodule PhoenixApiBoilerplateWeb.OfferController do
  use PhoenixApiBoilerplateWeb, :controller

  alias PhoenixApiBoilerplate.V1
  alias PhoenixApiBoilerplate.V1.Offer

  action_fallback PhoenixApiBoilerplateWeb.FallbackController

  def index(conn, _params) do
    offers = V1.list_offers()
    render(conn, "index.json", offers: offers)
  end

  def create(conn, %{"offer" => offer_params}) do
    with {:ok, %Offer{} = offer} <- V1.create_offer(offer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.offer_path(conn, :show, offer))
      |> render("show.json", offer: offer)
    end
  end

  def show(conn, %{"id" => id}) do
    offer = V1.get_offer!(id)
    render(conn, "show.json", offer: offer)
  end

  def update(conn, %{"id" => id, "offer" => offer_params}) do
    offer = V1.get_offer!(id)

    with {:ok, %Offer{} = offer} <- V1.update_offer(offer, offer_params) do
      render(conn, "show.json", offer: offer)
    end
  end

  def delete(conn, %{"id" => id}) do
    offer = V1.get_offer!(id)

    with {:ok, %Offer{}} <- V1.delete_offer(offer) do
      send_resp(conn, :no_content, "")
    end
  end
end
