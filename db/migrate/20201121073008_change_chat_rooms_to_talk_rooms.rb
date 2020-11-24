class ChangeChatRoomsToTalkRooms < ActiveRecord::Migration[6.0]
  def change
    rename_table :chat_rooms, :talk_rooms
  end
end
