defmodule Subscription.Repo do
  use Ecto.Repo,
    otp_app: :subscription,
    adapter: Ecto.Adapters.Postgres
end
