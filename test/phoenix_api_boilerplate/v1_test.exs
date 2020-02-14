defmodule PhoenixApiBoilerplate.V1Test do
  use PhoenixApiBoilerplate.DataCase

  alias PhoenixApiBoilerplate.V1

  describe "orders" do
    alias PhoenixApiBoilerplate.V1.Order

    @valid_attrs %{offer_id: 42, user_id: 42}
    @update_attrs %{offer_id: 43, user_id: 43}
    @invalid_attrs %{offer_id: nil, user_id: nil}

    def order_fixture(attrs \\ %{}) do
      {:ok, order} =
        attrs
        |> Enum.into(@valid_attrs)
        |> V1.create_order()

      order
    end

    test "list_orders/0 returns all orders" do
      order = order_fixture()
      assert V1.list_orders() == [order]
    end

    test "get_order!/1 returns the order with given id" do
      order = order_fixture()
      assert V1.get_order!(order.id) == order
    end

    test "create_order/1 with valid data creates a order" do
      assert {:ok, %Order{} = order} = V1.create_order(@valid_attrs)
      assert order.offer_id == 42
      assert order.user_id == 42
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = V1.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = V1.update_order(order, @update_attrs)
      assert order.offer_id == 43
      assert order.user_id == 43
    end

    test "update_order/2 with invalid data returns error changeset" do
      order = order_fixture()
      assert {:error, %Ecto.Changeset{}} = V1.update_order(order, @invalid_attrs)
      assert order == V1.get_order!(order.id)
    end

    test "delete_order/1 deletes the order" do
      order = order_fixture()
      assert {:ok, %Order{}} = V1.delete_order(order)
      assert_raise Ecto.NoResultsError, fn -> V1.get_order!(order.id) end
    end

    test "change_order/1 returns a order changeset" do
      order = order_fixture()
      assert %Ecto.Changeset{} = V1.change_order(order)
    end
  end
end
