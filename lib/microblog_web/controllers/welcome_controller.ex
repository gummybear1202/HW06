defmodule MicroblogWeb.WelcomeController do
  use MicroblogWeb, :controller

  def show(conn, %{"welcome" => welcome }) do
    render(conn, "show.html", welcome: welcome)
  end
end
