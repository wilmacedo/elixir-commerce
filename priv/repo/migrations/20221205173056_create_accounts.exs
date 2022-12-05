defmodule Comercio.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :name, :string
      add :lastName, :string
      add :password, :string

      timestamps()
    end
  end
end
