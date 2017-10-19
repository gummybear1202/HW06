defmodule MicroblogWeb.WelcomeController do
  use MicroblogWeb, :controller

  def show(conn) do
    render conn, "show.html"
  end
end
