defmodule MicroblogWeb.FeedController do
  use MicroblogWeb, :controller

  def show(conn, %{"ftag" => ftag }) do
    render conn, "show.html"
  end
end
