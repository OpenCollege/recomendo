class Follow < ApplicationRecord
  # The user giving the follow
  belongs_to :following_user, class_name: "User", counter_cache: :followings_count

  # The user being followed
  belongs_to :followed_user, class_name: "User", counter_cache: :followers_count

  # Counter Cache:
  # https://guides.rubyonrails.org/association_basics.html#options-for-belongs-to-counter-cache
  # To the following_user, increases the count of users he is following
  # To the followed_user, it received a new follower, so increase the count of followers
end
