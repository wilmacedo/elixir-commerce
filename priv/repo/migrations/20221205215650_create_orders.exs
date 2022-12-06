defmodule Comercio.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :clientId, :integer

      timestamps()
    end
  end
end
