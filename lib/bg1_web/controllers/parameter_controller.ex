defmodule Bg1Web.ParameterController do
  use Bg1Web, :controller

  alias Bg1.Parameters
  alias Bg1.Parameters.Parameter

  def index(conn, _params) do
    parameters = Parameters.list_parameters()
    render(conn, "index.html", parameters: parameters)
  end

  def new(conn, _params) do
    changeset = Parameters.change_parameter(%Parameter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"parameter" => parameter_params}) do
    case Parameters.create_parameter(parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter created successfully.")
        |> redirect(to: Routes.parameter_path(conn, :show, parameter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parameter = Parameters.get_parameter!(id)
    render(conn, "show.html", parameter: parameter)
  end

  def edit(conn, %{"id" => id}) do
    parameter = Parameters.get_parameter!(id)
    changeset = Parameters.change_parameter(parameter)
    render(conn, "edit.html", parameter: parameter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "parameter" => parameter_params}) do
    parameter = Parameters.get_parameter!(id)

    case Parameters.update_parameter(parameter, parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter updated successfully.")
        |> redirect(to: Routes.parameter_path(conn, :show, parameter))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", parameter: parameter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parameter = Parameters.get_parameter!(id)
    {:ok, _parameter} = Parameters.delete_parameter(parameter)

    conn
    |> put_flash(:info, "Parameter deleted successfully.")
    |> redirect(to: Routes.parameter_path(conn, :index))
  end
end
