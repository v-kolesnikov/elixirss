defmodule Elixirss.RepoTest do
  use ExUnit.Case, async: true
  doctest Elixirss.Repo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Elixirss.Repo)
  end

  test "repo" do
    assert Elixirss.Repo.insert(
      %Elixirss.RSS.Entry{
        url: "http://example.com",
        title: "example.com",
        feed: %Elixirss.RSS.Feed{
          active: true,
          url: "http://feeds.feedburner.com/ElixirLang?format=xml"
        }
      }
    )

    feed =
      Elixirss.RSS.Feed
      |> Ecto.Query.first
      |> Elixirss.Repo.one
    assert feed.id
    assert feed.url == "http://feeds.feedburner.com/ElixirLang?format=xml"

    entry =
      Elixirss.RSS.Entry
      |> Ecto.Query.first
      |> Elixirss.Repo.one
    assert entry.id
  end
end
