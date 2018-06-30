defmodule Elixirss.RSS.Entry do
  @moduledoc """
  RSS entry.
  """

  use Ecto.Schema

  alias Elixirss.RSS.Feed

  schema "entries" do
    belongs_to :feed, Feed

    field :title, :string
    field :url, :string
    field :pub_date, :utc_datetime
    field :guid, :string

    timestamps([{:inserted_at, :created_at}])
  end

  @spec guid(Elixirss.RSS.Entry) :: String.t
  def guid(entry) do
    entry.guid || entry.url
  end
end
