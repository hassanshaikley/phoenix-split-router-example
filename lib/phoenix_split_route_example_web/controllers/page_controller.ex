defmodule PhoenixSplitRouteExampleWeb.PageController do
  use PhoenixSplitRouteExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
