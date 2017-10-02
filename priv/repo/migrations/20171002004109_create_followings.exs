defmodule Microblog.Repo.Migrations.CreateFollowings do
  use Ecto.Migration

  def change do
    create table(:followings) do
      add :following_email, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:followings, [:user_id])
  end
end
