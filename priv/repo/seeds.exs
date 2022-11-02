# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bg1.Repo.insert!(%Bg1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Bg1.{Accounts, Parameters, Rows}



Accounts.register_user(%{email: "bg1@bg1.com", password: "bg1"})
Rows.create_row(  %{title: "row 1"})
Rows.create_row(  %{title: "row 2"})
Parameters.create_parameter(  %{signature: "signature", phonelink: "phonelink", user_id: 1})
