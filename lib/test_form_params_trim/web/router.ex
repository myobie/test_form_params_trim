defmodule TestFormParamsTrim.Web.Router do
  use TestFormParamsTrim.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", TestFormParamsTrim.Web do
    pipe_through :browser

    resources "/users", UsersController, only: [:create, :show], param: "login"
  end
end
