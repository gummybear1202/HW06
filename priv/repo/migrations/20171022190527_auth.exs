defmodule Microblog.Repo.Migrations.Auth do
  use Ecto.Migration

  def change do

    alter table("users") do
      add :authorized, :boolean, null: false, default: false
    end
  end
end
