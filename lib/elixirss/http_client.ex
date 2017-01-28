defmodule Elixirss.HTTPClient do
  @moduledoc """
  HTTP client for fetch RSS feed.
  """

  use Tesla, only: ~w(get)a, docs: false

  plug Tesla.Middleware.Logger

  @spec call(String.t) :: String.t
  def call(url) do
    url
    |> get
    |> Map.get(:body)
  end
end
