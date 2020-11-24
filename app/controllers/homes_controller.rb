class HomesController < ApplicationController
  def index
    @user = User.new
    @others = User.where.not(id: current_user.id)
  end
end
