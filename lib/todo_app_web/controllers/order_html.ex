defmodule TodoAppWeb.OrderHTML do
  use TodoAppWeb, :html

  embed_templates "order_html/*"

  @doc """
  Renders an order form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def order_form(assigns)
end
