defmodule Bg1Web.RowLive.Show do
  use Bg1Web, :live_view

  alias Bg1.Rows

  alias Bg1Web.ContactComponent
  on_mount Bg1Web.AssignUser
  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:row, Rows.get_row!(id))}
  end

  defp page_title(:show), do: "Show Row"
  defp page_title(:edit), do: "Edit Row"
end
