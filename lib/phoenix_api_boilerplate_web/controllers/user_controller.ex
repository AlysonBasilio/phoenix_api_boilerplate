defmodule PhoenixApiBoilerplateWeb.UserController do
  use PhoenixApiBoilerplateWeb, :controller

  alias PhoenixApiBoilerplate.V1
  alias PhoenixApiBoilerplate.V1.User

  action_fallback PhoenixApiBoilerplateWeb.FallbackController

  def index(conn, _params) do
    users = V1.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- V1.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = V1.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = V1.get_user!(id)

    with {:ok, %User{} = user} <- V1.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = V1.get_user!(id)

    with {:ok, %User{}} <- V1.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
