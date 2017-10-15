// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

import socket from "./socket"
// this file contains references from Ryan Hughes repo

let handlebars = require("handlebars");

$(function() {
  if (!$("#likes-template").length > 0) {
    // Wrong page.
    return;
  }

  let tt = $($("#likes-template")[0]);
  let code = tt.html();
  let tmpl = handlebars.compile(code);

  let dd = $($("#message-likes")[0]);
  let path = dd.data('path');
  let m_id = dd.data('message_id');

  let bb = $($("#like-add-button")[0]);
  let u_id = bb.data('user_id');
  let u_email = bb.data('user_email');

  let ll = $($("#like-delete-button")[0]);
  u_email = bb.data('user_email');
  let cur_data = []

  function fetch_likes() {
    function got_likes(data) {
      console.log(data);
      cur_data = data;

      let html = tmpl(data);
      dd.html(html);
    }

    $.ajax({
      url: path,
      data: {message_id: m_id},
      contentType: "application/json",
      dataType: "json",
      method: "GET",
      success: got_likes,
    });
  }

  function add_like() {
    let data = {like: {message_id: m_id, user_id: u_id}};

    $.ajax({
      url: path,
      data: JSON.stringify(data),
      contentType: "application/json",
      dataType: "json",
      method: "POST",
      success: fetch_likes,
    });

    $("#like-add-button").hide()
    $("#like-delete-button").show()
  }

  function delete_like() {
      console.log(cur_data);
    var message_holder = 15;
    for (var i = 0; i < cur_data.data.length; i++) {
      console.log(cur_data.data[i].message_id);
      if (cur_data.data[i].message_id == m_id
          && cur_data.data[i].user_email == u_email) {
        console.log('if is triggered');
        message_holder = cur_data.data[i].id;
      }
    }
      $.ajax({
        url: path + "/" + message_holder,
        contentType: "application/json",
        dataType: "json",
        method: "DELETE",
        success: fetch_likes,
        });


    $("#like-add-button").show()
    $("#like-delete-button").hide()
  }


  bb.click(add_like);
  ll.click(delete_like);

  fetch_likes();
});
