defmodule PhoenixApiBoilerplate.V1.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
  end
end
