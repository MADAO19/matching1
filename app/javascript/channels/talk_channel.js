import consumer from "./consumer"
  consumer.subscriptions.create("TalkRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('.talk').append(data['content']);
  },

  speak: function() {
    return this.perform('speak', {
    message: message,
        room_id: room_id,
        user_id: $('meta[name="current_user_id"]').attr('content')
      });
  }
});
$(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
  if (event.keyCode === 13) {
    speak(event.target.value);
    event.target.value = '';
    return event.preventDefault();
  }
});