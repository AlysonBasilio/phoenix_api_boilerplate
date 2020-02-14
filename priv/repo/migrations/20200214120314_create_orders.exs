defmodule PhoenixApiBoilerplate.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :user_id, :integer
      add :offer_id, :integer

      timestamps()
    end

  end
end
