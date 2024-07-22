import consumer from "channels/consumer"

document.addEventListener('turbo:load', () => {
  const chatElement = document.getElementById('chat-id');

  if (chatElement) {
    const chatId = chatElement.getAttribute('data-chat-id')

    consumer.subscriptions.create({ channel: "ChatChannel", chat_id: chatId }, {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log(`Connected to chat channel ${chatId}!`)
      },
      disconnected() {
        // Called when the subscription has been terminated by the server
        console.log(`Disconnected from chat channel ${chatId}!`)
      },
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const messages = document.getElementById('messages')
        messages.insertAdjacentHTML('beforeend', data.message)
      }
    })
  }
});
