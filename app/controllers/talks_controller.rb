class TalksController < ApplicationController
  def index
    got_reaction_user_ids = Reaction.where(to_user_id: current_user.id, status: "like").pluck(:from_user_id)
    @talk_users = Reaction.where(to_user_id: got_reaction_user_ids, from_user_id: current_user.id, status: "like").map(&:to_user)
  end

  def create
  # 自分の持っているチャットルームを取得
  current_user_talk_rooms = TalkRoomUser.where(user_id: current_user.id).map(&:talk_room)
  # 自分の持っているチャットルームからチャット相手のいるルームを探す
  talk_room = TalkRoomUser.where(talk_room: current_user_talk_rooms, user_id: params[:user_id]).map(&:talk_room).first
  # なければ作成する
  if talk_room.blank?
    talk_room = TalkRoom.create
    TalkRoomUser.create(talk_room: talk_room, user_id: current_user.id)
    TalkRoomUser.create(talk_room: talk_room, user_id: params[:user_id])
  end
  # チャットルームへ遷移させる
  redirect_to action: :show, id: talk_room.id
end


def show
  # チャット相手の情報を取得する
  @talk_room = TalkRoom.find_by(id: params[:id])
  @talk_room_user = @talk_room.talk_room_users.where.not(user_id: current_user.id).first.user
  @talk_messages = TalkMessage.where(talk_room: TalkRoom.find_by(id: params[:id])).order(:created_at)
  @messages = TalkMessage.all
end

 end

