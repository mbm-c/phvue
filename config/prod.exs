
use Mix.Config

config :phvue, PhvueWeb.Endpoint,
  http: [port: System.get_env("PORT")],
  url: [scheme: "https", host: "phvue.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

# Configure your database
config :phvue, Phvue.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true,
  show_sensitive_data_on_connection_error: true
