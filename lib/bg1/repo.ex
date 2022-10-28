defmodule Bg1.Repo do
  use Ecto.Repo,
    otp_app: :bg1,
    adapter: Ecto.Adapters.Postgres
end
