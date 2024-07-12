import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('CONNECTED')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('DISCONNECTED')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const messages = document.getElementById('messages')
    messages.insertAdjacentHTML('beforeend', data.message)
  }
});
