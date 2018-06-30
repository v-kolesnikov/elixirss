defmodule Elixirss.Persistence do
  @moduledoc """
  Persistence layer.
  """

  alias Elixirss.Repo

  @spec call(list) :: list
  def call(entries \\ []) do
    Enum.map entries, fn entry -> Repo.insert(entry) end
  end
end
