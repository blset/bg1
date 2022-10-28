defmodule Bg1.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Bg1.Repo,
      # Start the Telemetry supervisor
      Bg1Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bg1.PubSub},
      # Start the Endpoint (http/https)
      Bg1Web.Endpoint
      # Start a worker by calling: Bg1.Worker.start_link(arg)
      # {Bg1.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bg1.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Bg1Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
