# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :elixirss, Elixirss.Repo,
  database: "elixirss_test",
  pool: Ecto.Adapters.SQL.Sandbox

config :logger, level: :info
