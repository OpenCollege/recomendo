class Post < ApplicationRecord
  acts_as_taggable
  belongs_to :category, optional: true

  def self.filter(params)
    posts = Post.all.order(created_at: :desc)
    posts = posts.where(category_id: params[:category_id]) if params[:category_id]
    posts = posts.tagged_with(params[:tags]) if params[:tags]
    posts
  end
end
