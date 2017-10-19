defmodule MicroblogWeb.Router do
  use MicroblogWeb, :router
  import MicroblogWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_user
    plug :put_user_token


  end

  defp put_user_token(conn, _) do
    if current_user = conn.assigns[:current_user] do
      token = Phoenix.Token.sign(conn, "user socket", current_user.id)
      assign(conn, :user_token, token)
    else
      conn
    end
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_user
  end

  scope "/", MicroblogWeb do
    pipe_through :browser # Use the default browser stack

    resources "/messages", MessageController
    resources "/users", UserController
    resources "/followings", FollowingController
    resources "/followers", FollowerController
    resources "/follows", FollowController

    post "/sessions", SessionController, :login
    delete "/sessions", SessionController, :logout

    get "/", PageController, :index
    get "/feed", FeedController, :show
    get "/welcome", WelcomeController, :show
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", MicroblogWeb do
    pipe_through :api

    resources "/likes", LikeController, except: [:new, :edit]

  end
end
