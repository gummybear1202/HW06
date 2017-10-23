# defmodule Microblog.Blog.Relation do
#   use Ecto.Schema
#   import Ecto.Changeset
#   alias Microblog.Blog.Relation
#
#
#   schema "relations" do
#     field :follower_email, :id
#     field :following_email, :id
#
#     timestamps()
#   end
#
#   @doc false
#   def changeset(%Relation{} = relation, attrs) do
#     relation
#     |> cast(attrs, [])
#     |> validate_required([])
#   end
# end
