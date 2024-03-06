defmodule TodoApp.Todo.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :order_name, :string
    field :order_time, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:order_name, :order_time])
    |> validate_required([:order_name, :order_time])
  end

end
