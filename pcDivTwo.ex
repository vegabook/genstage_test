defmodule GenstageTest.PcDivTwo do
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter, name: __MODULE__)
  end

  def init(state) do
    {:producer_consumer, state, subscribe_to: [GenstageTest.PcFilterEven]}
  end

  def handle_events(events, _from, state) do
    numbers =
      events
      |> Enum.map(&(&1 / 2))
    {:noreply, numbers, state}
  end
end