defmodule Drink.Router do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http Drink.Router, []
  end

  get "/" do
    conn
    |> send_resp(200, "OK")
    |> halt
  end

  match _ do  
    conn
    |> send_resp(404, "NOT OK")
    |> halt
  end  
end
