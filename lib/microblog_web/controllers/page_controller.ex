defmodule MicroblogWeb.PageController do
  use MicroblogWeb, :controller

  def index(conn, _params) do
    redirect conn, to: welcome_path(conn, :show)
  end
end
