defmodule Elixirss.FeedParserTest do
  use ExUnit.Case, async: true
  doctest Elixirss.FeedParser

  alias Elixirss.FeedParser

  test "call" do
    feed_size =
      "test/fixtures/elixir_feed.xml"
      |> File.read!
      |> FeedParser.call
      |> Enum.count
    assert 25 = feed_size
  end
end
