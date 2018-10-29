defmodule GenstageTest.Producer do
  use GenStage

  def start_link(initial \\ 1) do
    GenStage.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def init(counter), do: {:producer, counter}

  def handle_demand(demand, state) do
    events = Enum.to_list(state..(state + demand - 1))
    {:noreply, events, state + demand}
  end

  def handle_info({:doprint}, state) do
    IO.puts "yep"
    {:noreply, [], state}
  end

  def handle_info({:cancel, sublink}, state) do
    GenStage.cancel sublink, []
    {:noreply, [], state}
  end

end
