defmodule Comercio.Accounts.Users do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "accounts" do
    field :lastName, :string
    field :name, :string
    field :role, :string
    field :password, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:name, :lastName, :role, :password])
    |> validate_required([:name, :lastName, :role, :password])
    |> update_change(:password, &Bcrypt.hashpwsalt/1)
  end
end
