defmodule GenstageTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    import Supervisor.Spec, warn: false
    children = [
      worker(GenstageTest.Producer, [0]),
      worker(GenstageTest.PcAddOne, []),
      worker(GenstageTest.PcTimesFive, []),
      worker(GenstageTest.PcSubSeven, []),
      worker(GenstageTest.PcFilterEven, []),
      worker(GenstageTest.PcDivTwo, []),
      worker(GenstageTest.Consumer, [])
      # Starts a worker by calling: GenstageTest.Worker.start_link(arg)
      # {GenstageTest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GenstageTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
