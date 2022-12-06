defmodule Comercio.Repo.Migrations.AddOrderToProduct do
  use Ecto.Migration

  def change do
    alter table(:foods) do
      add :order, :integer
    end
  end
end
