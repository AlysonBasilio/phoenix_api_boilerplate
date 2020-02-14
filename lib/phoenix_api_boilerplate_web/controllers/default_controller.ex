defmodule PhoenixApiBoilerplateWeb.DefaultController do
  use PhoenixApiBoilerplateWeb, :controller

  def index(conn, _params) do
    text conn, "Welcome to our Phoenix Api Boilerplate"
  end
end
