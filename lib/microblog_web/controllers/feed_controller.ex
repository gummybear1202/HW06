defmodule Microblog.Web.FeedController do
  use Microblog.Web, :controller

  def show(conn, %{"ftag" => ftag }) do
    render conn, "show.html"
  end
end
