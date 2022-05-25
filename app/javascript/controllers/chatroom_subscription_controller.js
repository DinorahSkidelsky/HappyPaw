import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";
import Rails from "@rails/ujs";

export default class extends Controller {
  static values = { chatroomId: Number };
  static targets = ["messages", "input", "form"];

  connect() {
    console.log(
      `Subscribe to the chatroom with the id ${this.chatroomIdValue}.`
    );
  }


  sendMessage(event) {
    console.log(event.code)
    if (event.code == "Enter") {
      console.log("hola")
      console.log(this.formTarget)
        Rails.fire(this.formTarget, "submit");
    }
  }


    connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
     //     console.log(data);
     //     const message = document.querySelector(".messages")
     //     console.log(message.dataset.userId);
     //     const newMessage = `<div class="right-message">
     //   <p>${data}</p>
     // </div>`;
    //    this.messagesTarget.insertAdjacentHTML("beforeend", newMessage);
          location.reload();
        }
      }
    );
      this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    }

}
