class FollowsController < ApplicationController
  before_action :set_user
  respond_to :js

  def create
    @user.received_follows.create(following_user: current_user)

    respond_to do |format|
      format.js { render inline: "location.reload()" }
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  def destroy
    @user.received_follows.find_by(following_user: current_user).destroy

    respond_to do |format|
      format.js { render inline: "location.reload()" }
      format.html { redirect_back(fallback_location: root_path) }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
