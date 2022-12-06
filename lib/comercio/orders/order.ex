defmodule Comercio.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :clientId, :integer
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status, :clientId])
    |> validate_required([:status, :clientId])
  end
end
