defmodule TestFormParamsTrim.Web.UsersController do
  alias TestFormParamsTrim.{Web, Users}
  use Web, :controller
  import TestFormParamsTrim.MapTrimmer

  action_fallback Web.FallbackController

  def create(conn, %{"user" => user_params}) do
    with {:ok, user} <- Users.create_user(trim(user_params)) do
      conn
      |> put_status(:created)
      |> text("Hello new user '#{user.login}'")
    end
  end

  def show(conn, %{"login" => login}) do
    with {:ok, user} <- Users.get_user_by_login(login) do
      text conn, "Yo '#{user.login}'"
    end
  end
end
