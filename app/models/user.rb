class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :likes

  has_one_attached :image

  def full_name
    "#{first_name} #{last_name}"
  end

  def profile_image
    if image.attached?
      image
    else
      "https://api.adorable.io/avatars/285/#{email}"
    end
  end

  # https://mensfeld.pl/2013/12/rails-devise-and-remember_me-rememberable-by-default/
  def remember_me
    true
  end

end
