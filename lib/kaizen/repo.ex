defmodule Kaizen.Repo do
  use Ecto.Repo,
    otp_app: :kaizen,
    adapter: Ecto.Adapters.Postgres
end
