// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/web/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/2" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, pass the token on connect as below. Or remove it
// from connect if you don't care about authentication.

socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("feed:lobby", {})
let feedsContainer = $("#feeds")
let messageField = $("#message-field")

  let bb = $($("#message-user")[0]);
  let u_email = bb.data('current_email');
  let u_id = bb.data('current_id');
  console.log("current user's email" + u_email);
  console.log("current user's id" + u_id);

messageField.off("keypress").on("keypress", event => {
  if(event.keyCode === 13) {
    channel.push("new_msg", {user: u_email, body: messageField.val()})
    messageField.val("")
  }
})

channel.on("new_msg", payload => {
  // stick most recent on top
  feedsContainer.prepend(messageTemplate(payload))
})

// using part of the sample code from the phoenix example
function sanitize(html){ return $("<div/>").text(html).html() }

function messageTemplate(msg){
  let username = sanitize(msg.user || "anonymous")
  let body     = sanitize(msg.body)

  return(`<p><a href='#'>[${username}]</a>&nbsp; ${body}</p>`)
}

// end using the code


channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

// channel for updating message
let msgChannel = socket.channel("updates:lobby", {})
let msgContainer = $("#messages-index-container tbody")
let msgInput = $("#message_desc")
let msgUser = $("#message_user.id")
let msgField = $("#msg-field")
let msgSubmit = $("#msg-submit")

  let mm = $($("#msg-user")[0]);
  let mu_id = mm.data('current_id');
  let mu_email = mm.data('current_email');
  console.log("mu id" + mu_id);
  console.log("mu email" + mu_email);

  // let ss_msgField = $($("msg-field")[0]);
  // let ss_id = ss_msgField.data('msg_id');

// click submit button
msgSubmit.off("click").on("click").off("keypress").on("keypress", event => {
  triggerPush(mu_id)
})

// press enter
msgField.off("keypress").on("keypress", event => {
  if(event.keyCode === 13) {
    triggerPush(mu_id)
  }
})

function triggerPush(user_id){

    console.log("pushing by press key or click")
    msgChannel.push("new_msg", {user: mu_id, body: msgInput.val()})
    msgField.val("")
}

msgChannel.on("new_msg", payload => {
  // stick most recent on top
  console.log("appending to the container in html")
  let msg =
  '<tr>' +
  '<td>' + payload["body"] + '</td>' +
  '<td>' + payload["user"] + '</td>' +
  // '<td class="text-right">' +
  //   '<span>' +
  //   '<%= link "Show", to: message_path(@conn, :show, message), class: "btn btn-default btn-xs" %>' +
  //   '</span>' +
  //   '<span>' +
  //   '<%= link "Edit", to: message_path(@conn, :edit, message), class: "btn btn-default btn-xs" %>' +
  //   '</span>' +
  //   '<span>' +
  //   '<%= link "Delete", to: message_path(@conn, :delete, message), method: :delete, data: [confirm: "Are you sure?"], class: "btn btn-danger btn-xs" %>' +
  //   '</span>' +
  // '</td>' +
  '</tr>';
  console.log("msg " + msg)
  msgContainer.prepend($(msg))
})

msgChannel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })


export default socket
