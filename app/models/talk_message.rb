class TalkMessage < ApplicationRecord
  belongs_to :talk_room
  belongs_to :user

  validates :message, presence: true
  
  after_create_commit { MessageBroadcastJob.perform_later self }
end
