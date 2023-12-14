defmodule Bookbot.Repo do
  use Ecto.Repo,
    otp_app: :bookbot,
    adapter: Ecto.Adapters.Postgres
end
