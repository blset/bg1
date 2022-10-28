defmodule Bg1.RowsTest do
  use Bg1.DataCase

  alias Bg1.Rows

  describe "rows" do
    alias Bg1.Rows.Row

    import Bg1.RowsFixtures

    @invalid_attrs %{title: nil}

    test "list_rows/0 returns all rows" do
      row = row_fixture()
      assert Rows.list_rows() == [row]
    end

    test "get_row!/1 returns the row with given id" do
      row = row_fixture()
      assert Rows.get_row!(row.id) == row
    end

    test "create_row/1 with valid data creates a row" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %Row{} = row} = Rows.create_row(valid_attrs)
      assert row.title == "some title"
    end

    test "create_row/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Rows.create_row(@invalid_attrs)
    end

    test "update_row/2 with valid data updates the row" do
      row = row_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %Row{} = row} = Rows.update_row(row, update_attrs)
      assert row.title == "some updated title"
    end

    test "update_row/2 with invalid data returns error changeset" do
      row = row_fixture()
      assert {:error, %Ecto.Changeset{}} = Rows.update_row(row, @invalid_attrs)
      assert row == Rows.get_row!(row.id)
    end

    test "delete_row/1 deletes the row" do
      row = row_fixture()
      assert {:ok, %Row{}} = Rows.delete_row(row)
      assert_raise Ecto.NoResultsError, fn -> Rows.get_row!(row.id) end
    end

    test "change_row/1 returns a row changeset" do
      row = row_fixture()
      assert %Ecto.Changeset{} = Rows.change_row(row)
    end
  end
end
