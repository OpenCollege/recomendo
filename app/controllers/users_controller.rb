class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.where.not(id: current_user)
  end

  def show
    @user
  end

  def edit
    @edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :image)
  end


end
