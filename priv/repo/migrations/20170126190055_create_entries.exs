defmodule Elixirss.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :feed_id, references(:feeds)

      add :url, :string
      add :title, :string
      add :pub_date, :utc_datetime
      add :guid, :string

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
