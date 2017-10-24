defmodule Microblog.FeedbackTest do
  use Microblog.DataCase

  alias Microblog.Feedback

  describe "likes" do
    alias Microblog.Feedback.Like
    alias Microblog.Blog
    alias Microblog.Blog.User
    alias Microblog.Blog.Message

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def valid_attrs() do
      {:ok, user} = Blog.create_user(%{user_email: "some user_email",
                      password: "somesome", authorized: false})
      {:ok, message} = Blog.create_message(%{desc: "some comments", user_id: user.id})
      %{user: user, message: message}
    end

    def like_fixture(attrs \\ %{}) do
      {:ok, like} =
        attrs
        |> Enum.into(valid_attrs())
        |> Feedback.create_like()

      like
      Microblog.Repo.preload(like, [:user])
    end

    test "list_likes/0 returns all likes" do
      like = like_fixture()
      assert Feedback.list_likes() == [like]
    end

    test "get_like!/1 returns the like with given id" do
      like = like_fixture()
      assert Feedback.get_like!(like.id) == like
    end

    test "create_like/1 with valid data creates a like" do
      assert {:ok, %Like{} = like} = Feedback.create_like(valid_attrs())
    end

    test "create_like/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Feedback.create_like(@invalid_attrs)
    end

    test "update_like/2 with valid data updates the like" do
      like = like_fixture()
      assert {:ok, like} = Feedback.update_like(like, @update_attrs)
      assert %Like{} = like
    end

    test "update_like/2 with invalid data returns error changeset" do
      like = like_fixture()
      assert {:error, %Ecto.Changeset{}} = Feedback.update_like(like, @invalid_attrs)
      assert like == Feedback.get_like!(like.id)
    end

    test "delete_like/1 deletes the like" do
      like = like_fixture()
      assert {:ok, %Like{}} = Feedback.delete_like(like)
      assert_raise Ecto.NoResultsError, fn -> Feedback.get_like!(like.id) end
    end

    test "change_like/1 returns a like changeset" do
      like = like_fixture()
      assert %Ecto.Changeset{} = Feedback.change_like(like)
    end
  end
end
