defmodule PhoenixApiBoilerplate.Repo.Migrations.CreateOffers do
  use Ecto.Migration

  def change do
    create table(:offers) do
      add :available_seats, :integer

      timestamps()
    end

  end
end
