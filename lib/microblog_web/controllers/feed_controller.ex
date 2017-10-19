defmodule MicroblogWeb.FeedController do
  use MicroblogWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
