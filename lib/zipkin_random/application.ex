defmodule ZipkinRandom.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ZipkinRandom.Worker.start_link(arg)
      # {ZipkinRandom.Worker, arg}
    ]

    _ = OpenTelemetry.register_application_tracer(:zipkin_random)

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ZipkinRandom.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
