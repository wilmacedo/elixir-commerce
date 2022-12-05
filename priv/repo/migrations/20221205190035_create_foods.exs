defmodule Comercio.Repo.Migrations.CreateFoods do
  use Ecto.Migration

  def change do
    create table(:foods) do
      add :name, :string
      add :img, :string
      add :category, :string
      add :price, :decimal

      timestamps()
    end
  end
end
