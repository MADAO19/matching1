class ChatRoomUsersToTalkRoomUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :chat_room_users, :talk_room_users
  end
end
