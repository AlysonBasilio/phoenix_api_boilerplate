defmodule PhoenixApiBoilerplateWeb.Router do
  use PhoenixApiBoilerplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixApiBoilerplateWeb do
    pipe_through :api
  end
end
