defmodule Comercio.Procuts.Food do
  use Ecto.Schema
  import Ecto.Changeset

  schema "foods" do
    field :category, :string
    field :img, :string
    field :name, :string
    field :price, :decimal

    timestamps()
  end

  @doc false
  def changeset(food, attrs) do
    food
    |> cast(attrs, [:name, :img, :category, :price])
    |> validate_required([:name, :img, :category, :price])
  end
end
