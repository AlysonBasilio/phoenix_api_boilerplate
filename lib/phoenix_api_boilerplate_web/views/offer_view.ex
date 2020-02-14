defmodule PhoenixApiBoilerplateWeb.OfferView do
  use PhoenixApiBoilerplateWeb, :view
  alias PhoenixApiBoilerplateWeb.OfferView

  def render("index.json", %{offers: offers}) do
    %{data: render_many(offers, OfferView, "offer.json")}
  end

  def render("show.json", %{offer: offer}) do
    %{data: render_one(offer, OfferView, "offer.json")}
  end

  def render("offer.json", %{offer: offer}) do
    %{id: offer.id,
      available_seats: offer.available_seats}
  end
end
