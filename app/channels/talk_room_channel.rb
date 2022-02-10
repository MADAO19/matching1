class TalkRoomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "talk_room_channel_#{params['room']}"
     stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    TalkMessage.create! message: data['message'], user_id: current_user.id, talk_room_id: params['room']
  end
end
