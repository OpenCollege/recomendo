class LikesController < ApplicationController
  before_action :set_post

  def create
    @post.likes.create(user: current_user)
    redirect_to posts_url
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

end
