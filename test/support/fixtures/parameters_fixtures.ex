defmodule Bg1.ParametersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bg1.Parameters` context.
  """

  @doc """
  Generate a parameter.
  """
  def parameter_fixture(attrs \\ %{}) do
    {:ok, parameter} =
      attrs
      |> Enum.into(%{
        phonelink: "some phonelink",
        signature: "some signature"
      })
      |> Bg1.Parameters.create_parameter()

    parameter
  end
end
