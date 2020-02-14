defmodule PhoenixApiBoilerplate.V1Test do
  use PhoenixApiBoilerplate.DataCase

  alias PhoenixApiBoilerplate.V1

  describe "users" do
    alias PhoenixApiBoilerplate.V1.User

    @valid_attrs %{name: "some name", status: "some status"}
    @update_attrs %{name: "some updated name", status: "some updated status"}
    @invalid_attrs %{name: nil, status: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> V1.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert V1.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert V1.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = V1.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.status == "some status"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = V1.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = V1.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.status == "some updated status"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = V1.update_user(user, @invalid_attrs)
      assert user == V1.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = V1.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> V1.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = V1.change_user(user)
    end
  end

  describe "orders" do
    alias PhoenixApiBoilerplate.V1.Order

    @valid_attrs %{offer_id: 42, status: "some status", user_id: 42}
    @update_attrs %{offer_id: 43, status: "some updated status", user_id: 43}
    @invalid_attrs %{offer_id: nil, status: nil, user_id: nil}

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
      assert order.status == "some status"
      assert order.user_id == 42
    end

    test "create_order/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = V1.create_order(@invalid_attrs)
    end

    test "update_order/2 with valid data updates the order" do
      order = order_fixture()
      assert {:ok, %Order{} = order} = V1.update_order(order, @update_attrs)
      assert order.offer_id == 43
      assert order.status == "some updated status"
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

  describe "offers" do
    alias PhoenixApiBoilerplate.V1.Offer

    @valid_attrs %{available_seats: 42}
    @update_attrs %{available_seats: 43}
    @invalid_attrs %{available_seats: nil}

    def offer_fixture(attrs \\ %{}) do
      {:ok, offer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> V1.create_offer()

      offer
    end

    test "list_offers/0 returns all offers" do
      offer = offer_fixture()
      assert V1.list_offers() == [offer]
    end

    test "get_offer!/1 returns the offer with given id" do
      offer = offer_fixture()
      assert V1.get_offer!(offer.id) == offer
    end

    test "create_offer/1 with valid data creates a offer" do
      assert {:ok, %Offer{} = offer} = V1.create_offer(@valid_attrs)
      assert offer.available_seats == 42
    end

    test "create_offer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = V1.create_offer(@invalid_attrs)
    end

    test "update_offer/2 with valid data updates the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{} = offer} = V1.update_offer(offer, @update_attrs)
      assert offer.available_seats == 43
    end

    test "update_offer/2 with invalid data returns error changeset" do
      offer = offer_fixture()
      assert {:error, %Ecto.Changeset{}} = V1.update_offer(offer, @invalid_attrs)
      assert offer == V1.get_offer!(offer.id)
    end

    test "delete_offer/1 deletes the offer" do
      offer = offer_fixture()
      assert {:ok, %Offer{}} = V1.delete_offer(offer)
      assert_raise Ecto.NoResultsError, fn -> V1.get_offer!(offer.id) end
    end

    test "change_offer/1 returns a offer changeset" do
      offer = offer_fixture()
      assert %Ecto.Changeset{} = V1.change_offer(offer)
    end
  end
end
