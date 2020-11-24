/* global $ */
if(/talk/.test(window.location.pathname)) {
  var path = window.location.pathname.split('/');
  var room_id = path[path.length - 1];
  App.talk_room = App.cable.subscriptions.create({ channel: "TalkRoomChannel", room_id: room_id }, {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
      $('.talk_left, .talk_right').append(data['content']);
    },
    speak: function(message) {
      return this.perform('speak', {
        message: message,
        room_id: room_id,
        user_id: $('meta[name="current_user_id"]').attr('content')
      });
    }
  });
  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      App.talk_room.speak(event.target.value);
      event.target.value = '';
      return event.preventDefault();
    }
  });
}