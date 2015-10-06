defmodule Cyrus.OrderTest do
  use Cyrus.ModelCase

  alias Cyrus.Order

  @valid_attrs %{instructions: "some content", name: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Order.changeset(%Order{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Order.changeset(%Order{}, @invalid_attrs)
    refute changeset.valid?
  end
end
