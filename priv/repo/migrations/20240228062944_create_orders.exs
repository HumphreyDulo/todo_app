defmodule TodoApp.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :order_name, :string
      add :order_time, :string

      timestamps()
    end
  end
end
