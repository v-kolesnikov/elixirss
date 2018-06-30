defmodule Elixirss.FeedParser do
  @moduledoc """
  RSS feed parser.
  """

  @spec call(String.t) :: list
  def call(input \\ "") do
    input
    |> parse_xml
    |> Map.get(:entries)
    |> Enum.map(&to_entry/1)
  end

  defp parse_xml(input) do
    case Feedme.parse(input) do
      {:ok, data} -> data
      false -> %{}
    end
  end

  defp to_entry(%{
    :link => link,
    :title => title,
    :publication_date => publication_date,
    :guid => guid}) do
    %Elixirss.RSS.Entry{
      title: title,
      url: link,
      pub_date: publication_date,
      guid: guid || link
    }
  end
end
