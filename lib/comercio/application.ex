defmodule Comercio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Comercio.Repo,
      # Start the Telemetry supervisor
      ComercioWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Comercio.PubSub},
      # Start the Endpoint (http/https)
      ComercioWeb.Endpoint
      # Start a worker by calling: Comercio.Worker.start_link(arg)
      # {Comercio.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Comercio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ComercioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
