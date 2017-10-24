defmodule MicroblogWeb.UserControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{user_email: "some user_email"}
  @update_attrs %{user_email: "some updated user_email"}
  @invalid_attrs %{user_email: nil}

  def fixture(:user) do
    {:ok, user} = Blog.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get conn, user_path(conn, :index)
      assert html_response(conn, 302) =~
      "<html><body>You are being <a href=\"/welcome\">redirected</a>.</body></html>"
    end
  end

  # describe "new user" do
  #   test "renders form", %{conn: conn} do
  #     conn = get conn, user_path(conn, :new)
  #     assert html_response(conn, 200) =~
  #     "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n <meta charset=\"utf-8\">\n <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n <meta name=\"description\" content=\"\">\n <meta name=\"author\" content=\"\">\n\n <title>Hello Microblog!</title>\n <link rel=\"stylesheet\" href=\"/css/app.css\">\n <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js\"></script>\n\n</head>\n\n<body>\n <nav class=\"navbar navbar-light bg-light navbar-expand-md\">\n <a class=\"navbar-brandk\">\n<a class=\"nav-link text-dark font-weight-bold\" href=\"/welcome\">Word</a> </a>\n <button class=\"navbar-toggler\" type=\"button\"\n data-toggle=\"collapse\" data-target=\"#main-navbar\">\n <span class=\"navbar-toggler-icon\"></span>\n </button>\n\n <div class=\"collapse navbar-collapse\" id=\"main-navbar\">\n <ul class=\"navbar-nav mr-auto\">\n <!-- News feed -->\n <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/messages\">Dashboard</a> </li>\n <!-- For looking at the user's own info -->\n <!-- For looking at the users this user is following -->\n <li class=\"nav-item\">\n<a class=\"nav-link\" href=\"/feed\">Chat</a> </li>\n </ul>\n </div>\n\n <form accept-charset=\"UTF-8\" action=\"/sessions\" class=\"form-inline w-75\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"QHE+KwIEdmUaMiMzZSYtYnELXX45EAAAyFvMVkEJKgfRQqnM28oMMQ==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\">\n <input type=\"text\" placeholder=\"email\" class=\"form-control\" name=\"email\">\n <input type=\"password\" placeholder=\"password\" class=\"form-control\" name=\"password\">\n<button class=\"btn btn-primary\" type=\"submit\">Log in</button> </form>\n</nav>\n\n<div class=\"container\">\n\n <div class=\"row\">\n <div class=\"col-sm-12 my-2\">\n </div>\n </div>\n\n <div class=\"row\">\n <div class=\"col-sm-12\">\n<div class=\"container-fluid\">\n <br />\n <div class=\"row\">\n <div class=\"col-md-12 mx-auto\">\n <h3>who are you?</h3>\n </div>\n <div class=\"col-md-6 mx-auto\">\n<form accept-charset=\"UTF-8\" action=\"/users\" method=\"post\"><input name=\"_csrf_token\" type=\"hidden\" value=\"QHE+KwIEdmUaMiMzZSYtYnELXX45EAAAyFvMVkEJKgfRQqnM28oMMQ==\"><input name=\"_utf8\" type=\"hidden\" value=\"✓\"> \n <div class=\"form-group\">\n<label class=\"control-label\" for=\"user_user_email\">User email</label> <input class=\"form-control\" id=\"user_user_email\" name=\"user[user_email]\" type=\"text\">\n </div>\n\n <!-- adding password -->\n <div class=\"form-group\">\n<label class=\"control-label\" for=\"user_password\">Password</label> <input class=\"form-control\" id=\"user_password\" name=\"user[password]\" type=\"password\">\n </div>\n\n <div class=\"form-group\">\n<label class=\"control-label\" for=\"user_password_confirmation\">Password confirmation</label> <input class=\"form-control\" id=\"user_password_confirmation\" name=\"user[password_confirmation]\" type=\"password\">\n </div>\n\n <div class=\"form-group\">\n<button class=\"btn btn-primary\" type=\"submit\">Submit</button> </div>\n</form> </div>\n </div>\n\n<span><a href=\"/users\">Back</a></span>\n </div>\n </div>\n\n\n</div> <!-- /container -->\n<script src=\"/js/app.js\"></script>\n\n</body>\n</html>\n"
  #   end
  # end
  #
  # describe "create user" do
  #   test "redirects to show when data is valid", %{conn: conn} do
  #     conn = post conn, user_path(conn, :create), user: @create_attrs
  #
  #     assert %{id: id} = redirected_params(conn)
  #     assert redirected_to(conn) == user_path(conn, :show, id)
  #
  #     conn = get conn, user_path(conn, :show, id)
  #     assert html_response(conn, 200) =~ "Show User"
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn} do
  #     conn = post conn, user_path(conn, :create), user: @invalid_attrs
  #     assert html_response(conn, 200) =~ "New User"
  #   end
  # end

  # describe "edit user" do
  #   setup [:create_user]
  #
  #   test "renders form for editing chosen user", %{conn: conn, user: user} do
  #     conn = get conn, user_path(conn, :edit, user)
  #     assert html_response(conn, 200) =~ "Edit User"
  #   end
  # end
  #
  # describe "update user" do
  #   setup [:create_user]
  #
  #   test "redirects when data is valid", %{conn: conn, user: user} do
  #     conn = put conn, user_path(conn, :update, user), user: @update_attrs
  #     assert redirected_to(conn) == user_path(conn, :show, user)
  #
  #     conn = get conn, user_path(conn, :show, user)
  #     assert html_response(conn, 200) =~ "some updated user_email"
  #   end
  #
  #   test "renders errors when data is invalid", %{conn: conn, user: user} do
  #     conn = put conn, user_path(conn, :update, user), user: @invalid_attrs
  #     assert html_response(conn, 200) =~ "Edit User"
  #   end
  # end
  #
  # describe "delete user" do
  #   setup [:create_user]
  #
  #   test "deletes chosen user", %{conn: conn, user: user} do
  #     conn = delete conn, user_path(conn, :delete, user)
  #     assert redirected_to(conn) == user_path(conn, :index)
  #     assert_error_sent 404, fn ->
  #       get conn, user_path(conn, :show, user)
  #     end
  #   end
  # end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
