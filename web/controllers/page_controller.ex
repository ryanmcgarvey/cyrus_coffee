defmodule Cyrus.PageController do
  use Cyrus.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
