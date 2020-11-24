class ChangeChatMessagesToTalkMessages < ActiveRecord::Migration[6.0]
  def change
    rename_table :chat_messages, :talk_messages
  end
end
