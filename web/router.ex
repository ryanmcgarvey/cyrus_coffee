defmodule Cyrus.Router do
  use Cyrus.Web, :router

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

  scope "/", Cyrus do
    pipe_through :browser # Use the default browser stack
    get "/", OrderController, :index
    resources "/orders", OrderController do
      patch "/status", OrderController, :update_status
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cyrus do
  #   pipe_through :api
  # end
end
