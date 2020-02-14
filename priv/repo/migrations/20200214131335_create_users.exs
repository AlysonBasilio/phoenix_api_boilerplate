defmodule PhoenixApiBoilerplate.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :status, :string

      timestamps()
    end

  end
end
