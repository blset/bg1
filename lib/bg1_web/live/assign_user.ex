defmodule Bg1Web.AssignUser do

  alias Bg1.Accounts
  import Phoenix.Component

  def on_mount(:default, _params, session, socket) do
    {
      :cont,
      socket
      |> assign_new(
        :current_user,
        fn ->
          Accounts.get_user_by_session_token_with_parameter(session["user_token"])
        end
      )
      |> assign_new(
        :testvar,
        fn ->
          "test var from assign new"
        end
      )
    }
  end
end
