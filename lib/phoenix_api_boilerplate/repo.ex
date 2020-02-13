defmodule PhoenixApiBoilerplate.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_api_boilerplate,
    adapter: Ecto.Adapters.Postgres
end
