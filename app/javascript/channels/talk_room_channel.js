import consumer from "./consumer"

$(function() {
const chatChannel = consumer.subscriptions.create({channel: "TalkRoomChannel", room: $('.talk').data('talk_room_id') },{
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementsByClassName('talk');
    messages.insertAdjacentHTML('beforeend', data['message']);
    //return $('.talk').append(data['message']);
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(message) {    //クライアントサイドのspeakアクションの定義
    return this.perform('speak', {
      message: message      //サーバーサイドのspeakアクションを呼び出し、messageをmessageパラメータで渡す
    });
  }
});

$(document).on('keypress', '[data-behavior~=room_speaker]', function(e) {
  if (e.keyCode === 13) {
    chatChannel.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
 });
});