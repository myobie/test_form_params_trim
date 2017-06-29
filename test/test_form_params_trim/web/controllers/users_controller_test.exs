defmodule TestFormParamsTrim.Web.UsersControllerTest do
  use TestFormParamsTrim.Web.ConnCase

  def build_user_params(attrs \\ %{}) do
    %{"user" => Map.merge(%{"login" => ""}, attrs)}
  end

  describe "POST /usrs" do
    test "does not accept blank login", %{conn: conn} do
      url = users_path(conn, :create)
      resp = conn
             |> post(url, build_user_params())
             |> response(400)

      assert resp =~ "Sent some bad data"
    end

    test "works", %{conn: conn} do
      url = users_path(conn, :create)
      resp = conn
             |> post(url, build_user_params(%{"login" => "myobie"}))
             |> response(201)

      assert resp == "Hello new user 'myobie'"
    end
  end

  test "trims strings", %{conn: conn} do
    url = users_path(conn, :create)
    resp = conn
           |> post(url, build_user_params(%{"login" => "myobie  "}))
           |> response(201)

    assert resp == "Hello new user 'myobie'"
  end
end
