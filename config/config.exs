# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :cyrus, Cyrus.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Y9Kfajvm4BFmHM0Ed9KBOEwXEkfF+BhIN4fz4dwlsFi1MhY3+yT5JGFDEEFUFyQv",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Cyrus.PubSub,
           adapter: Phoenix.PubSub.PG2],
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex|haml)$}
    ]
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

 config :phoenix, :template_engines,
  haml: PhoenixHaml.Engine
