defmodule MicroblogWeb.Plugs do
  import Plug.Conn

  # Add this to plugs module, use it in pipeline in router

  def fetch_user(conn, _opts) do
    user_id = get_session(conn, :user_id)
    if user_id do
      user = Microblog.Blog.get_user!(user_id)
      token = Phoenix.Token.sign(conn, "user socket", user.id)
      assign(conn, :current_user, user, :user_token, token)
    else
      assign(conn, :current_user, nil)
    end

  end

end
