defmodule Example.Worker do
  def start_link(_args) do
    Task.start_link(fn -> perform_task() end)
  end

  def perform_task do
    IO.puts("Performing background task...")
    :timer.sleep(1000)
    IO.puts("Task finished.")
  end
end

def start(_type, _args) do
  children = [
    {Example.Worker, []}
  ]
  Supervisor.start_link(children, strategy: :one_for_one)
end
