defmodule Cyrus.OrderController do
  use Cyrus.Web, :controller
  alias Cyrus.Order

  plug :scrub_params, "order" when action in [:create, :update]

  def index(conn, _params) do
    orders = Repo.all(Order)
    render(conn, "index.html", orders: orders)
  end

  def new(conn, _params) do
    changeset = Order.changeset(%Order{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"order" => order_params}) do
    changeset = Order.changeset(%Order{}, Map.put(order_params, "status", "new"))

    case Repo.insert(changeset) do
      {:ok, order} ->
        order_body = Phoenix.View.render_to_string(Cyrus.OrderView, "order.html", %{order: order, conn: conn})
        Cyrus.Endpoint.broadcast "orders", "new_order", %{"body" => order_body}
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: order_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Repo.get!(Order, id)
    render(conn, "show.html", order: order)
  end

  def accept(conn, %{"id" => id}) do
    order = Repo.get!(Order, id)
    changeset = Order.changeset(order, %{"status" => "accepted"})

    case Repo.update(changeset) do
      {:ok, order} ->
        conn
        render(conn, "order_item.html", ordeR: order)
      {:error, changeset} ->
        render(conn, "order_item.html", order: order, changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    order = Repo.get!(Order, id)
    changeset = Order.changeset(order)
    render(conn, "edit.html", order: order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Repo.get!(Order, id)
    changeset = Order.changeset(order, order_params)

    case Repo.update(changeset) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: order_path(conn, :show, order))
      {:error, changeset} ->
        render(conn, "edit.html", order: order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Repo.get!(Order, id)
    Repo.delete!(order)
    conn
    |> put_flash(:info, "Order deleted successfully.")
    |> redirect(to: order_path(conn, :index))
  end

  def update_status(conn, %{"action" => action, "order_id" => id}) do
    order = Repo.get!(Order, id)
    status = case action do
      "accept" -> "accepted"
      "reject" -> "rejected"
    end
    changeset = Order.changeset(order, %{"status" => status})
    case Repo.update(changeset) do
      {:ok, order} ->
        order_body = Phoenix.View.render_to_string(Cyrus.OrderView, "order_item.html", %{order: order, conn: conn})
        Cyrus.Endpoint.broadcast "orders", "updated", %{"body" => order_body}
        conn
        |> send_resp(201, "")
      {:error, changeset} ->
        conn
        |> send_resp(500, "")
    end
  end
end
