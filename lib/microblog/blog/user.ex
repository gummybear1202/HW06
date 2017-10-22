defmodule Microblog.Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.User
  alias Microblog.Blog.Message
  alias Microblog.Blog.Follow

  schema "users" do
    field :user_email, :string
    field :authorized?, :boolean
    has_many :messages, Message
    has_many :follows, Follow
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:user_email, :authorized?])
    |> validate_required([:user_email])
  end
end
