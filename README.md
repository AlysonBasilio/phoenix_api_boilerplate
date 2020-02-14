# PhoenixApiBoilerplate

To start your Phoenix server:

  * Install docker
  * Build container image with `docker-compose build`
  * Install dependencies `docker-compose run api mix deps.get`
  * Setup database `docker-compose run api mix ecto.setup`
  * Start running project and its database with `docker-compose up`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To open application console:
  * Setup database `docker-compose exec -it phoenix_api_boilerplate_api iex -S mix`

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## RabbitMQ Ops

  ```
    IO.puts "Open connection"
    {:ok, amqp_connection} = AMQP.Connection.open(host: "rabbitmq", username: "user", password: "password")

    IO.puts "Open channel"
    {:ok, amqp_channel} = AMQP.Channel.open(amqp_connection)

    IO.puts "Declare Exchange"
    AMQP.Exchange.declare(amqp_channel, "order_created_exchange")

    IO.puts "Declare Queue"
    AMQP.Queue.declare(amqp_channel, "order_service_queue")

    IO.puts "Bind Queue To Exchange"
    AMQP.Queue.bind(amqp_channel, "order_service_queue", "order_created_exchange")

    IO.puts "Publish message"
    AMQP.Basic.publish(amqp_channel, "order_created_exchange", "", Jason.encode!(%{id: order.id}))

    IO.puts "Close connection"
    AMQP.Connection.close(amqp_connection)
  ```
