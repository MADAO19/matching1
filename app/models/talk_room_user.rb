class TalkRoomUser < ApplicationRecord
  belongs_to :talk_room
  belongs_to :user
end
