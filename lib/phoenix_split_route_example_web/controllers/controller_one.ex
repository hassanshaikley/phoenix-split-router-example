defmodule PhoenixSplitRouteExampleWeb.ControllerOne do
  use PhoenixSplitRouteExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "one.html")
  end
end
