defmodule MicroblogWeb.SessionController do
  use MicroblogWeb, :controller

  alias Microblog.Blog

  def login(conn, %{"email" => email}) do
    # require IEx; Iex.pry
    user = Blog.get_user_by_email!(email)

    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.user_email}")
      |> redirect(to: user_path(conn, :show, user.id))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "No such user")
      |> redirect(to: user_path(conn, :index))
    end
  end

  def logout(conn, _params) do
    conn
    |> put_session(:user_id, nil)
    |> put_flash(:info, "Logged out")
    |> redirect(to: user_path(conn, :index))
  end
end
