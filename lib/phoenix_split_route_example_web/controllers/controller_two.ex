defmodule PhoenixSplitRouteExampleWeb.ControllerTwo do
  use PhoenixSplitRouteExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "two.html")
  end
end
