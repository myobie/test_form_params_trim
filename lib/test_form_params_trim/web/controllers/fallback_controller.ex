defmodule TestFormParamsTrim.Web.FallbackController do
  use TestFormParamsTrim.Web, :controller

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> text("Not found")
  end

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> text("Sent some bad data: #{inspect(changeset)}")
  end

  def call(conn, {:error, error}) do
    conn
    |> put_status(:internal_server_error)
    |> text("There was some sort of error: #{inspect(error)}")
  end
end
