defmodule Microblog.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.User
  alias Microblog.Blog.Message
  alias Microblog.Blog.Following

  schema "users" do
    field :user_email, :string
    has_many :messages, Message
    has_many :followings, Following
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:user_email])
    |> validate_required([:user_email])
  end
end
