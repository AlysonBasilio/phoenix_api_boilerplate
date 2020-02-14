defmodule PhoenixApiBoilerplate.V1.Offer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "offers" do
    field :available_seats, :integer

    timestamps()
  end

  @doc false
  def changeset(offer, attrs) do
    offer
    |> cast(attrs, [:available_seats])
    |> validate_required([:available_seats])
  end
end
