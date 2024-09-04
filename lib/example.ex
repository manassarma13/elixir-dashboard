defmodule Example do
  use Application
  def start(_type, _args) do
    IO.puts(Example.flying())
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def flying do
    :whale
  end
end
