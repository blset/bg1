defmodule Bg1.RowsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bg1.Rows` context.
  """

  @doc """
  Generate a row.
  """
  def row_fixture(attrs \\ %{}) do
    {:ok, row} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Bg1.Rows.create_row()

    row
  end
end
