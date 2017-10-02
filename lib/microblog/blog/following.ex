defmodule Microblog.Blog.Following do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Following


  schema "followings" do
    field :following_email, :string
    belongs_to :user, Microblog.Blog.User

    timestamps()
  end

  @doc false
  def changeset(%Following{} = following, attrs) do
    following
    |> cast(attrs, [:following_email, :user_id])
    |> validate_required([:following_email])
  end
end
