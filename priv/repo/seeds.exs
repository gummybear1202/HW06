# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Blog.User
alias Microblog.Blog.Message
alias Microblog.Feedback.Like
alias Microblog.Blog.Follow

Repo.delete_all(Like)
Repo.delete_all(Follow)
Repo.delete_all(Message)
Repo.delete_all(User)

Repo.insert!(%User{user_email: "rosaline@gmail.com", password: "rosaline", authorized: false})
Repo.insert!(%User{user_email: "user1@gmail.com", password: "user1@gmail.com", authorized: false})
Repo.insert!(%User{user_email: "admin@admin.com", password: "admin@admin.com", authorized: true})
