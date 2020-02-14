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
      resources "/offers", OfferController, except: [:new, :edit]
      resources "/orders", OrderController, except: [:new, :edit]
      resources "/users", UserController, except: [:new, :edit]
    end
  end
end
