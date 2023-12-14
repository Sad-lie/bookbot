defmodule Bookbot.UserRepo do
  use Ecto.Repo,
    otp_app: :bookbot,
    adapter: Ecto.Adapters.Postgres

  # Add any additional configuration or functions here
end
