defmodule Elixirss.Repo.Migrations.CreateFeeds do
  use Ecto.Migration

  def change do
    create table(:feeds) do
      add :url, :string
      add :active, :boolean
      add :last_guid, :string
      add :last_build, :utc_datetime
      add :last_fetch, :utc_datetime

      timestamps([{:inserted_at, :created_at}])
    end
  end
end
