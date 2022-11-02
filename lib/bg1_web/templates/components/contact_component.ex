defmodule Bg1Web.ContactComponent do
  use Phoenix.Component

  alias Bg1.Parameters.Parameter

  alias Bg1.Rows.Row
  alias Bg1.Parameters.Parameter

  @moduledoc """

    component templates

    """


  attr :row, Row, required: true
  attr :parameter, Parameter, default: %Parameter{}
  def display(assigns) do
    ~H"""
    <%= @row.title%>

    Phonelink <%= Map.get @parameter, :phonelink %>
      <%#= inspect @parameter.phonelink %>
    """
  end

end
