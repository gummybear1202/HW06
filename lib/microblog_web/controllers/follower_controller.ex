defmodule MicroblogWeb.FollowerController do
  use MicroblogWeb, :controller

  alias Microblog.Blog
  alias Microblog.Blog.Follower

  def index(conn, _params) do
    followers = Blog.list_followers()
    render(conn, "index.html", followers: followers)
  end

  def new(conn, _params) do
    changeset = Blog.change_follower(%Follower{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"follower" => follower_params}) do
    case Blog.create_follower(follower_params) do
      {:ok, follower} ->
        conn
        |> put_flash(:info, "Follower created successfully.")
        |> redirect(to: follower_path(conn, :show, follower))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    follower = Blog.get_follower!(id)
    render(conn, "show.html", follower: follower)
  end

  def edit(conn, %{"id" => id}) do
    follower = Blog.get_follower!(id)
    changeset = Blog.change_follower(follower)
    render(conn, "edit.html", follower: follower, changeset: changeset)
  end

  def update(conn, %{"id" => id, "follower" => follower_params}) do
    follower = Blog.get_follower!(id)

    case Blog.update_follower(follower, follower_params) do
      {:ok, follower} ->
        conn
        |> put_flash(:info, "Follower updated successfully.")
        |> redirect(to: follower_path(conn, :show, follower))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", follower: follower, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    follower = Blog.get_follower!(id)
    {:ok, _follower} = Blog.delete_follower(follower)

    conn
    |> put_flash(:info, "Follower deleted successfully.")
    |> redirect(to: follower_path(conn, :index))
  end
end
