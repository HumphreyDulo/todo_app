defmodule TodoAppWeb.OrderController do
  use TodoAppWeb, :controller

  alias TodoApp.Todo
  alias TodoApp.Todo.Order

  def index(conn, _params) do
    orders = Todo.list_orders()
    render(conn, :index, orders: orders)
  end

  def new(conn, _params) do
    changeset = Todo.change_order(%Todo.Order{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"order" => order_params}) do
    case Todo.create_order(order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order created successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    order = Todo.get_order!(id)
    render(conn, :show, order: order)
  end

  def edit(conn, %{"id" => id}) do
    order = Todo.get_order!(id)
    changeset = Todo.change_order(order)
    render(conn, :edit, order: order, changeset: changeset)
  end

  def update(conn, %{"id" => id, "order" => order_params}) do
    order = Todo.get_order!(id)

    case Todo.update_order(order, order_params) do
      {:ok, order} ->
        conn
        |> put_flash(:info, "Order updated successfully.")
        |> redirect(to: Routes.order_path(conn, :show, order))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, order: order, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    order = Todo.get_order!(id)
    {:ok, _order} = Todo.delete_order(order)

    conn
    |> put_flash(:info, "Order deleted successfully.")
    |> redirect(to: Routes.order_path(conn, :index))
  end
end
