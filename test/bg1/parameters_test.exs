defmodule Bg1.ParametersTest do
  use Bg1.DataCase

  alias Bg1.Parameters

  describe "parameters" do
    alias Bg1.Parameters.Parameter

    import Bg1.ParametersFixtures

    @invalid_attrs %{phonelink: nil, signature: nil}

    test "list_parameters/0 returns all parameters" do
      parameter = parameter_fixture()
      assert Parameters.list_parameters() == [parameter]
    end

    test "get_parameter!/1 returns the parameter with given id" do
      parameter = parameter_fixture()
      assert Parameters.get_parameter!(parameter.id) == parameter
    end

    test "create_parameter/1 with valid data creates a parameter" do
      valid_attrs = %{phonelink: "some phonelink", signature: "some signature"}

      assert {:ok, %Parameter{} = parameter} = Parameters.create_parameter(valid_attrs)
      assert parameter.phonelink == "some phonelink"
      assert parameter.signature == "some signature"
    end

    test "create_parameter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Parameters.create_parameter(@invalid_attrs)
    end

    test "update_parameter/2 with valid data updates the parameter" do
      parameter = parameter_fixture()
      update_attrs = %{phonelink: "some updated phonelink", signature: "some updated signature"}

      assert {:ok, %Parameter{} = parameter} = Parameters.update_parameter(parameter, update_attrs)
      assert parameter.phonelink == "some updated phonelink"
      assert parameter.signature == "some updated signature"
    end

    test "update_parameter/2 with invalid data returns error changeset" do
      parameter = parameter_fixture()
      assert {:error, %Ecto.Changeset{}} = Parameters.update_parameter(parameter, @invalid_attrs)
      assert parameter == Parameters.get_parameter!(parameter.id)
    end

    test "delete_parameter/1 deletes the parameter" do
      parameter = parameter_fixture()
      assert {:ok, %Parameter{}} = Parameters.delete_parameter(parameter)
      assert_raise Ecto.NoResultsError, fn -> Parameters.get_parameter!(parameter.id) end
    end

    test "change_parameter/1 returns a parameter changeset" do
      parameter = parameter_fixture()
      assert %Ecto.Changeset{} = Parameters.change_parameter(parameter)
    end
  end
end
