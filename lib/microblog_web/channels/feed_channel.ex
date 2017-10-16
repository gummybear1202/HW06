defmodule MicroblogWeb.FeedChannel do
  use MicroblogWeb, :channel

  def join("feed:lobby", payload, socket) do
    if authorized?(payload) do
      # send(self, {:join_record, payload})
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # # notify joined successfully
  # def handle_info({:join_record, payload}, socket) do
  #   broadcast! socket, "user:entered the chat", %{user: payload["user"]}
  #   push socket, "join", %{status: "connected"}
  #   {:noreply, socket}
  # end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("new_msg", payload, socket) do
    broadcast! socket, "new_msg", %{user: payload["user"], body: payload["body"]}
    {:reply, {:ok, %{payload: payload["body"]}}, assign(socket, :user, payload["user"])}
  end

  def handle_out("new_msg", payload, socket) do
    # this payload["user"] is the message sender
    # if Blog.ignoring_user?(socket.assigns[:user], payload["user"]) do
    #   {:noreply, socket}
    # else
      push socket, "new_msg", payload
      {:noreply, socket}
    # end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
