class SearchesController < ApplicationController
  def show
    if params[:q].present?
      @users = User.where("CONCAT(first_name, ' ' ,last_name) ILIKE ?", "%#{params[:q]}%").order(followers_count: :desc).limit(5)
    else
      @users = []
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
