class TalkChannel < ApplicationCable::Channel
  def subscribed
    stream_from "talk_room_#{[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  end
