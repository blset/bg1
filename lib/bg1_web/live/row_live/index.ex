defmodule Bg1Web.RowLive.Index do
  use Bg1Web, :live_view

  alias Bg1.Rows
  alias Bg1.Rows.Row

  on_mount Bg1Web.AssignUser
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :rows, list_rows())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Row")
    |> assign(:row, Rows.get_row!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Row")
    |> assign(:row, %Row{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Rows")
    |> assign(:row, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    row = Rows.get_row!(id)
    {:ok, _} = Rows.delete_row(row)

    {:noreply, assign(socket, :rows, list_rows())}
  end

  defp list_rows do
    Rows.list_rows()
  end
end
