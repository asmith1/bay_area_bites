defmodule BayAreaBites.Repo do
  use Ecto.Repo,
    otp_app: :bay_area_bites,
    adapter: Ecto.Adapters.Postgres
end
