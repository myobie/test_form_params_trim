defmodule TestFormParamsTrim.Users do
  alias TestFormParamsTrim.Repo
  alias TestFormParamsTrim.Users.User

  def create_user(params) when is_map(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end

  def get_user(id) do
    case User |> Repo.get(id) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end

  def get_user_by_login(login) do
    case User |> Repo.get_by(login: login) do
      nil -> {:error, :not_found}
      user -> {:ok, user}
    end
  end
end
