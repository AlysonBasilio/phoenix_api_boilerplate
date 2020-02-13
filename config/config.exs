# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_api_boilerplate,
  ecto_repos: [PhoenixApiBoilerplate.Repo]

# Configures the endpoint
config :phoenix_api_boilerplate, PhoenixApiBoilerplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m7EV3eGAZRqmeACFv61gOt40IKEip6zLjzNTNnAhRqJpiv32cLP18MDdkfPU+e2a",
  render_errors: [view: PhoenixApiBoilerplateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixApiBoilerplate.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "Fd04tYhQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
