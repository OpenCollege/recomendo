class Post < ApplicationRecord
  belongs_to :category, optional: true

  has_and_belongs_to_many :tags

  def self.filter(params)
    posts = Post.all.order(created_at: :desc)
    posts = posts.where(category_id: params[:category_id]) if params[:category_id]
    posts = posts.where(tag: params[:tag]) if params[:tag]
    posts
  end
end
