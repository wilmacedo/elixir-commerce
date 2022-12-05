defmodule Comercio.Repo do
  use Ecto.Repo,
    otp_app: :comercio,
    adapter: Ecto.Adapters.Postgres
end
