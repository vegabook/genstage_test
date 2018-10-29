defmodule GenstageTest.Consumer do
  use GenStage

  def start_link do
    GenStage.start_link(__MODULE__, :state_doesnt_matter)
  end

  def init(state) do
    {:consumer, state}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      File.write("/home/tbrowne/scratch/output.txt", 
        Kernel.inspect(event) <> " ", [:append])
      :timer.sleep(100)
    end

    # As a consumer we never emit events
    {:noreply, [], state}
  end
end

