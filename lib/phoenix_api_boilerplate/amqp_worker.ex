defmodule PhoenixApiBoilerplate.AMQPWorker do
  use GenServer

  ## Client API

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: :publisher)
  end

  def publish(message, exchange) do
    GenServer.cast(:publisher, {:publish, message, exchange})
  end

  ## Server Callbacks

  def init(:ok) do
    {:ok, connection} = AMQP.Connection.open(host: "rabbitmq", username: "user", password: "password")
    {:ok, channel} = AMQP.Channel.open(connection)
    {:ok, %{channel: channel, connection: connection} }
  end

  def handle_cast({:publish, message, exchange}, state) do
    AMQP.Basic.publish(state.channel, exchange, "", message)
    {:noreply, state}
  end

  def terminate(_reason, state) do
    AMQP.Connection.close(state.connection)
  end
end
