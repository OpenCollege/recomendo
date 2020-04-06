class LikesController < ApplicationController
  before_action :set_post

  def create
    @post.likes.create(user: current_user)
    respond_to :js
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    respond_to :js
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
