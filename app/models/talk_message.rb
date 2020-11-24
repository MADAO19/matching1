class TalkMessage < ApplicationRecord
  belongs_to :talk_room
  belongs_to :user
end
