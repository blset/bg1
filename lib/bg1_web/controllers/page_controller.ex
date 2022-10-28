defmodule Bg1Web.PageController do
  use Bg1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
