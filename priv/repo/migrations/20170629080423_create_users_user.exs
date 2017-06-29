defmodule TestFormParamsTrim.Repo.Migrations.CreateTestFormParamsTrim.Users.User do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public")

    create table(:users) do
      add :login, :citext, null: false

      timestamps()
    end

    create unique_index(:users, [:login])
  end

  def down do
    drop unique_index(:users, [:login])
    drop table(:users)
  end
end
