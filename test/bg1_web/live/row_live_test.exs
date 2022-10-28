defmodule Bg1Web.RowLiveTest do
  use Bg1Web.ConnCase

  import Phoenix.LiveViewTest
  import Bg1.RowsFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  defp create_row(_) do
    row = row_fixture()
    %{row: row}
  end

  describe "Index" do
    setup [:create_row]

    test "lists all rows", %{conn: conn, row: row} do
      {:ok, _index_live, html} = live(conn, Routes.row_index_path(conn, :index))

      assert html =~ "Listing Rows"
      assert html =~ row.title
    end

    test "saves new row", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.row_index_path(conn, :index))

      assert index_live |> element("a", "New Row") |> render_click() =~
               "New Row"

      assert_patch(index_live, Routes.row_index_path(conn, :new))

      assert index_live
             |> form("#row-form", row: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#row-form", row: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.row_index_path(conn, :index))

      assert html =~ "Row created successfully"
      assert html =~ "some title"
    end

    test "updates row in listing", %{conn: conn, row: row} do
      {:ok, index_live, _html} = live(conn, Routes.row_index_path(conn, :index))

      assert index_live |> element("#row-#{row.id} a", "Edit") |> render_click() =~
               "Edit Row"

      assert_patch(index_live, Routes.row_index_path(conn, :edit, row))

      assert index_live
             |> form("#row-form", row: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#row-form", row: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.row_index_path(conn, :index))

      assert html =~ "Row updated successfully"
      assert html =~ "some updated title"
    end

    test "deletes row in listing", %{conn: conn, row: row} do
      {:ok, index_live, _html} = live(conn, Routes.row_index_path(conn, :index))

      assert index_live |> element("#row-#{row.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#row-#{row.id}")
    end
  end

  describe "Show" do
    setup [:create_row]

    test "displays row", %{conn: conn, row: row} do
      {:ok, _show_live, html} = live(conn, Routes.row_show_path(conn, :show, row))

      assert html =~ "Show Row"
      assert html =~ row.title
    end

    test "updates row within modal", %{conn: conn, row: row} do
      {:ok, show_live, _html} = live(conn, Routes.row_show_path(conn, :show, row))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Row"

      assert_patch(show_live, Routes.row_show_path(conn, :edit, row))

      assert show_live
             |> form("#row-form", row: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#row-form", row: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.row_show_path(conn, :show, row))

      assert html =~ "Row updated successfully"
      assert html =~ "some updated title"
    end
  end
end
