
# credits
design of live-feeds referenced the phoenix documentation:
https://hexdocs.pm/phoenix/channels.html
which contains a walk through of a sample:
https://github.com/chrismccord/phoenix_chat_example

setting up the deployment referenced this question to give permission to running the shell file:
https://askubuntu.com/questions/38661/how-do-i-run-sh-files

credits to Nat Tuck's repo:
https://github.com/NatTuck/nu_mart

the automate deployment file was referencing the deploy.sh from Nat Tuck's github repo. Several changes are made with path to adjust the path that my server points to. So the deployment can be done inside of the github directory.

# Behavior of Like:
Requirement: should log in as one of an existing user: user1@gmail.com
After successfully logs in, either by clicking on the 'new?' tab on the navigation bar, or directly access: https://microblog.rosaline.im/messages to view existing messages. Click on one message to show.
In the show page, click 'like' will allow the current user to like a message.
A card is shown with the current user's email indicating this user has liked this post.

Click 'unlike' will delete the like for that message by the current user.

*side note* accessing the https://microblog.rosaline.im/api/v1/likes bring up the json file for all the likes data

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
