class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast"talk_room_channel_#{talk_message.talk_room_id}", message: render_message(message)
  end

  private

    def render_message(message)
      ApplicationController.renderer.render(partial: 'talk_messages/talk_message', locals: { message: message })
    end
  end