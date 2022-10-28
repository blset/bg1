defmodule Bg1Web.RowLive.FormComponent do
  use Bg1Web, :live_component

  alias Bg1.Rows

  @impl true
  def update(%{row: row} = assigns, socket) do
    changeset = Rows.change_row(row)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"row" => row_params}, socket) do
    changeset =
      socket.assigns.row
      |> Rows.change_row(row_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"row" => row_params}, socket) do
    save_row(socket, socket.assigns.action, row_params)
  end

  defp save_row(socket, :edit, row_params) do
    case Rows.update_row(socket.assigns.row, row_params) do
      {:ok, _row} ->
        {:noreply,
         socket
         |> put_flash(:info, "Row updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_row(socket, :new, row_params) do
    case Rows.create_row(row_params) do
      {:ok, _row} ->
        {:noreply,
         socket
         |> put_flash(:info, "Row created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
