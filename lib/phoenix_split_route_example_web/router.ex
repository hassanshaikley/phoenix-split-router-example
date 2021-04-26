defmodule PhoenixSplitRouteExampleWeb.RouterOne do
  use Phoenix.Router

  get "/one", PhoenixSplitRouteExampleWeb.ControllerOne, :index
end

defmodule PhoenixSplitRouteExampleWeb.RouterTwo do
  use Phoenix.Router

  get "/two", PhoenixSplitRouteExampleWeb.ControllerTwo, :index
end

defmodule PhoenixSplitRouteExampleWeb.Router do
  use PhoenixSplitRouteExampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixSplitRouteExampleWeb do
    pipe_through :browser

    # preferable to use match because you have access to the prefix
    # https://elixirforum.com/t/umbrella-app-routing-with-plug-router-app-phoenix-app/10213/6
    # forward "/one", RouterOne
    # forward "/two", RouterTwo

    match(:*, "/one/", RouterOne, :*)
    match(:*, "/two/", RouterTwo, :*)
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixSplitRouteExampleWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: PhoenixSplitRouteExampleWeb.Telemetry
    end
  end
end
