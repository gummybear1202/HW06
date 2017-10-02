defmodule MicroblogWeb.FollowingControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{following_email: "some following_email"}
  @update_attrs %{following_email: "some updated following_email"}
  @invalid_attrs %{following_email: nil}

  def fixture(:following) do
    {:ok, following} = Blog.create_following(@create_attrs)
    following
  end

  describe "index" do
    test "lists all followings", %{conn: conn} do
      conn = get conn, following_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Followings"
    end
  end

  describe "new following" do
    test "renders form", %{conn: conn} do
      conn = get conn, following_path(conn, :new)
      assert html_response(conn, 200) =~ "New Following"
    end
  end

  describe "create following" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, following_path(conn, :create), following: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == following_path(conn, :show, id)

      conn = get conn, following_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Following"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, following_path(conn, :create), following: @invalid_attrs
      assert html_response(conn, 200) =~ "New Following"
    end
  end

  describe "edit following" do
    setup [:create_following]

    test "renders form for editing chosen following", %{conn: conn, following: following} do
      conn = get conn, following_path(conn, :edit, following)
      assert html_response(conn, 200) =~ "Edit Following"
    end
  end

  describe "update following" do
    setup [:create_following]

    test "redirects when data is valid", %{conn: conn, following: following} do
      conn = put conn, following_path(conn, :update, following), following: @update_attrs
      assert redirected_to(conn) == following_path(conn, :show, following)

      conn = get conn, following_path(conn, :show, following)
      assert html_response(conn, 200) =~ "some updated following_email"
    end

    test "renders errors when data is invalid", %{conn: conn, following: following} do
      conn = put conn, following_path(conn, :update, following), following: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Following"
    end
  end

  describe "delete following" do
    setup [:create_following]

    test "deletes chosen following", %{conn: conn, following: following} do
      conn = delete conn, following_path(conn, :delete, following)
      assert redirected_to(conn) == following_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, following_path(conn, :show, following)
      end
    end
  end

  defp create_following(_) do
    following = fixture(:following)
    {:ok, following: following}
  end
end
