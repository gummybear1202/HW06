defmodule MicroblogWeb.SessionController do
  use MicroblogWeb, :controller

  alias Microblog.Blog


  # TODO: Move to user.ex
  def get_and_auth_user(email, password) do
    user = Blog.get_user_by_email(email)
    case Comeonin.Argon2.check_pass(user, password) do
      {:ok, user} -> user
      _else       -> nil
    end
  end


  def login(conn, %{"email" => email, "password" => password}) do
    # require IEx; Iex.pry
    user = get_and_auth_user(email, password)

    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.user_email}")
      |> redirect(to: user_path(conn, :show, user.id))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "Badd email/password")
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
