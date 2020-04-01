class UsersController < ApplicationController
  # before_action :set_post, only: [:show]

  def show
    @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
