# reference Nat Tuck's test.diff
defmodule Microblog.BlogTest do
  use Microblog.DataCase

  alias Microblog.Blog

  describe "messages" do
    alias Microblog.Blog.Message

    @valid_attrs %{desc: "some desc", user: "some user"}
    @update_attrs %{desc: "some updated desc", user: "some updated user"}
    @invalid_attrs %{desc: nil, user: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Blog.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Blog.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Blog.create_message(@valid_attrs)
      assert message.desc == "some desc"
      # assert message.user == "some user"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Blog.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.desc == "some updated desc"
      # assert message.user == "some updated user"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_message(message, @invalid_attrs)
      assert message == Blog.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Blog.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Blog.change_message(message)
    end
  end

  describe "users" do
    alias Microblog.Blog.User

    @valid_attrs %{user_email: "some user_email", password: "somesome", authorized: false}
    @update_attrs %{user_email: "some updated user_email"}
    @invalid_attrs %{user_email: nil, password: nil, authorized: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Blog.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Blog.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Blog.create_user(@valid_attrs)
      assert user.user_email == "some user_email"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Blog.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.user_email == "some updated user_email"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_user(user, @invalid_attrs)
      assert user == Blog.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Blog.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Blog.change_user(user)
    end
  end

  describe "follows" do
    alias Microblog.Blog.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Blog.create_follow()

      follow
    end

    # test "list_follows/0 returns all follows" do
    #   follow = follow_fixture()
    #   assert Blog.list_follows() == [follow]
    # end

    # test "get_follow!/1 returns the follow with given id" do
    #   follow = follow_fixture()
    #   assert Blog.get_follow!(follow.id) == follow
    # end
    #
    # test "create_follow/1 with valid data creates a follow" do
    #   assert {:ok, %Follow{} = follow} = Blog.create_follow(@valid_attrs)
    # end
    #
    # test "create_follow/1 with invalid data returns error changeset" do
    #   assert {:error, %Ecto.Changeset{}} = Blog.create_follow(@invalid_attrs)
    # end

    # test "update_follow/2 with valid data updates the follow" do
    #   follow = follow_fixture()
    #   assert {:ok, follow} = Blog.update_follow(follow, @update_attrs)
    #   assert %Follow{} = follow
    # end

    # test "update_follow/2 with invalid data returns error changeset" do
    #   follow = follow_fixture()
    #   assert {:error, %Ecto.Changeset{}} = Blog.update_follow(follow, @invalid_attrs)
    #   assert follow == Blog.get_follow!(follow.id)
    # end

    # test "delete_follow/1 deletes the follow" do
    #   follow = follow_fixture()
    #   assert {:ok, %Follow{}} = Blog.delete_follow(follow)
    #   assert_raise Ecto.NoResultsError, fn -> Blog.get_follow!(follow.id) end
    # end
    #
    # test "change_follow/1 returns a follow changeset" do
    #   follow = follow_fixture()
    #   assert %Ecto.Changeset{} = Blog.change_follow(follow)
    # end
  end
end
