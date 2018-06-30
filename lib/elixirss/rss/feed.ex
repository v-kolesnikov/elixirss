defmodule Elixirss.RSS.Feed do
  @moduledoc """
  RSS feed.
  """

  use Ecto.Schema

  alias Elixirss.RSS.Entry

  schema "feeds" do
    has_many :entries, Entry

    field :url, :string
    field :active, :boolean
    field :last_guid, :string
    field :last_build, :utc_datetime
    field :last_fetch, :utc_datetime

    timestamps([{:inserted_at, :created_at}])
  end
end
