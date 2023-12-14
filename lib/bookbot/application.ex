defmodule Bookbot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BookbotWeb.Telemetry,
      Bookbot.Repo,
      {DNSCluster, query: Application.get_env(:bookbot, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Bookbot.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Bookbot.Finch},
      # Start a worker by calling: Bookbot.Worker.start_link(arg)
      # {Bookbot.Worker, arg},
      # Start to serve requests, typically the last entry
      BookbotWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bookbot.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BookbotWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
