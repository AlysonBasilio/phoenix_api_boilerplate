# PhoenixApiBoilerplate

To start your Phoenix server:

  * Install docker
  * Build container image with `docker-compose build`
  * Install dependencies `docker-compose run api mix deps.get`
  * Setup database `docker-compose run api mix ecto.setup`
  * Start running project and its database with `docker-compose up`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To open application console:
  * Setup database `docker-compose exec -it phoenix_api_boilerplate iex -S mix`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
