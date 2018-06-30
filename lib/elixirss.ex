defmodule Elixirss do
  @moduledoc """
  Entrypoint for Elixirss.
  """

  alias Elixirss.HTTPClient
  alias Elixirss.FeedFilter
  alias Elixirss.FeedParser
  alias Elixirss.Persistence

  @spec start(any, any) :: :ok | {:error, term}
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Elixirss.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Elixirss.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @spec call(String.t) :: list
  def call(url) do
    url
    |> HTTPClient.call
    |> FeedParser.call
    |> FeedFilter.call
    |> Persistence.call
  end
end
