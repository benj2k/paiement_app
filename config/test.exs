import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :paiement_app, PaiementAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "1zaivSFzuoRX0tLeUcPHZ7bnKC++csF16RbV2mUvIEXa1VTAWmO8mgDDy9OxStOW",
  server: false

# In test we don't send emails.
config :paiement_app, PaiementApp.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
