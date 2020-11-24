class RenameChatRoomIdColumnToTalkMessages < ActiveRecord::Migration[6.0]
  def change
    rename_column :talk_messages, :chat_room_id, :talk_room_id
  end
end
