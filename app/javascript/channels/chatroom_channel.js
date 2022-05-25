import consumer from "./consumer"

const chatroomChannel = () => {
  const messages = document.querySelector(".messages")
  const chatId = messages.dataset.chatroomId
  consumer.subscriptions.create({
    channel: "chatroomChannel", id: chatId},
    {
      received(data) {
        const userId = document.querySelector(".messages_list").dataser.userId
        console.log("hola")
      }
  })
}

export default chatroomChannel;
