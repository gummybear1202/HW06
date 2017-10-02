defmodule Microblog.Blog.Follower do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Follower


  schema "followers" do
    field :follower_email, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Follower{} = follower, attrs) do
    follower
    |> cast(attrs, [:follower_email])
    |> validate_required([:follower_email])
  end
end
