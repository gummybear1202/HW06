defmodule Microblog.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
	create table(:messages) do
		add :desc, :string
		add :user, :string
		
		timestamps()
	end
  end
end
