defmodule SampleApp.Router do
  use SampleApp.Web, :router

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

  scope "/", SampleApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/home", StaticPageController, :home
    get "/help", StaticPageController, :help
    get "/about", StaticPageController, :about
    get "/contact", StaticPageController, :contact
    get "/signup", UserController, :new
    resources "/user", UserController, except: [:new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleApp do
  #   pipe_through :api
  # end
end
