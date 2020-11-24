class TalkRoom < ApplicationRecord
  has_many :talk_messages
  has_many :talk_room_users
  has_many :users
end
