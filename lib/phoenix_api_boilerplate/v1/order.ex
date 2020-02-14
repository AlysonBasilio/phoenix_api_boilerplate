defmodule PhoenixApiBoilerplate.V1.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :offer_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:user_id, :offer_id])
    |> validate_required([:user_id, :offer_id])
  end
end
