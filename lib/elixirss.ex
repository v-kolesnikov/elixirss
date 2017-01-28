defmodule Elixirss do
  @moduledoc """
  Entrypoint for Elixirss.
  """

  @spec start(any, any) :: :ok | {:error, term}
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Elixirss.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Elixirss.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
