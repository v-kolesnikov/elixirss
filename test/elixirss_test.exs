defmodule ElixirssTest do
  use ExUnit.Case, async: true
  doctest Elixirss

  # TODO: Stub http request here

  @tag :skip
  test "call/1" do
    url = "http://feeds.feedburner.com/ElixirLang?format=xml"
    assert Elixirss.call(url)
  end
end
