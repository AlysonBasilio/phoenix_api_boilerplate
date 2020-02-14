defmodule PhoenixApiBoilerplateWeb.Router do
  use PhoenixApiBoilerplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixApiBoilerplateWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end

  scope "/api", PhoenixApiBoilerplateWeb do
    pipe_through :api
    scope "/v1" do
      resources "/orders", OrderController, except: [:new, :edit]
    end
  end
end
