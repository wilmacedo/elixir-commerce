defmodule Comercio.Repo.Migrations.ChangePasswordKey do
  use Ecto.Migration

  def change do
    rename table(:accounts), :password, to: :encrypted_password
  end
end
