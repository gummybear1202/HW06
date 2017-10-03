# HW04 REQS
Github repo: https://github.com/gummybear1202/CS4550_Microblog_Dev.git
deployed app: http://microblog.rosaline.im

Behavior of the app:


First you should be brought to the users page with all users (admin not implemented)

Then login on top using rosaline@gmail.com (since this is an existing user)

After logging in, you're brought to the show page of that user
	- which includes: user email, create a message, follow button

During create in this page, after successfully creating a message, you should be able to see the created message with the current user_id

Following is designed that when clicking the follow button, the currently viewing user should be the one being followed, the follower is the current in session.

Click 'back' to view existing users

Click 'show' on another user (user1@g...)

Click 'follow user' will make the current logged in user the follower, and following the viewing user

Blue tag on top proves that it's been added to the DB, even though the follow page doesn't show the user_ids


# Microblog

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
