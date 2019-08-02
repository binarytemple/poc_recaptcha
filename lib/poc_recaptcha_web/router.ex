defmodule PocRecaptchaWeb.Router do
  use PocRecaptchaWeb, :router

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

  scope "/", PocRecaptchaWeb do
    pipe_through :browser
    # resources "/", PageController

    get  "/", PageController, :index
    post "/", PageController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", PocRecaptchaWeb do
  #   pipe_through :api
  # end
end
