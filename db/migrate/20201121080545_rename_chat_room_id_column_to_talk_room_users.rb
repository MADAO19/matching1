class RenameChatRoomIdColumnToTalkRoomUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :talk_room_users, :chat_room_id, :talk_room_id
  end
end
