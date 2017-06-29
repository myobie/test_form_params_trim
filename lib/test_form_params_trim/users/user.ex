defmodule TestFormParamsTrim.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias TestFormParamsTrim.Users.User

  schema "users" do
    field :login, :string

    timestamps()
  end

  @type t :: %__MODULE__{}

  @spec changeset(t | Ecto.Changeset.t, map) :: Ecto.Changeset.t
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:login])
    |> validate_required([:login])
    |> unique_constraint(:login)
  end
end
