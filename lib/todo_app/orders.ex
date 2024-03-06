defmodule TodoApp.Orders do
   @moduledoc """
  The Todo context.
  """

import Ecto.Query, warn: false
alias TodoApp.Todo.Order
alias TodoApp.Repo



@doc """
Returns the list of tasks.

## Examples

    iex> list_tasks()
    [%Task{}, ...]

"""
def list_orders do
  Repo.all(Order)
end

@doc """
Gets a single task.

Raises `Ecto.NoResultsError` if the Task does not exist.

## Examples

    iex> get_task!(123)
    %Task{}

    iex> get_task!(456)
    ** (Ecto.NoResultsError)

"""
def get_order!(id), do: Repo.get!(Order, id)

@doc """
Creates a task.

## Examples

    iex> create_task(%{field: value})
    {:ok, %Task{}}

    iex> create_task(%{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def create_order(attrs \\ %{}) do
  %Order{}
  |> Order.changeset(attrs)
  |> Repo.insert()
end

@doc """
Updates a task.

## Examples

    iex> update_task(task, %{field: new_value})
    {:ok, %Task{}}

    iex> update_task(task, %{field: bad_value})
    {:error, %Ecto.Changeset{}}

"""
def update_order(%Order{} = order, attrs) do
  order
  |> Order.changeset(attrs)
  |> Repo.update()
end

@doc """
Deletes a task.

## Examples

    iex> delete_task(task)
    {:ok, %Task{}}

    iex> delete_task(task)
    {:error, %Ecto.Changeset{}}

"""
def delete_order(%Order{} = order) do
  Repo.delete(order)
end

@doc """
Returns an `%Ecto.Changeset{}` for tracking task changes.

## Examples

    iex> change_task(task)
    %Ecto.Changeset{data: %Task{}}

"""
def change_order(%Order{} = order, attrs \\ %{}) do
  Order.changeset(order, attrs)
end
end
