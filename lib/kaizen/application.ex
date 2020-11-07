defmodule Kaizen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Kaizen.Repo,
      # Start the Telemetry supervisor
      KaizenWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Kaizen.PubSub},
      # Start the Endpoint (http/https)
      KaizenWeb.Endpoint
      # Start a worker by calling: Kaizen.Worker.start_link(arg)
      # {Kaizen.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Kaizen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    KaizenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
