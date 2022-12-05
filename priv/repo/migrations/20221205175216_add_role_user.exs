defmodule Comercio.Repo.Migrations.AddRoleUser do
  use Ecto.Migration

  def change do
    alter table(:accounts) do
      add :role, :string
    end
  end
end
