class Category < ApplicationRecord
  has_many :posts

  validates :name, uniqueness: { case_sensitive: false }

  scope :by_name, -> { order(name: :asc) }

  def self.names
    all.map{|category| category.name}
  end

  def name_with_icon
    "#{icon} #{name.titleize}"
  end

  def plural_name_with_icon
    "#{icon} #{name.pluralize.titleize}"
  end

end
