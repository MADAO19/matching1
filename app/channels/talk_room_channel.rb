class TalkRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talk_room_#{[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message = TalkMessage.create(talk_room_id: data['talk_id'], user_id: data['user_id'], message: data['message'])
    TalkRoomChannel.broadcast_to "talk_room_#{data['room_id']}", content: render_message(message)
  end

  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'talks/show', locals: { talk_message: message })
    end
end
