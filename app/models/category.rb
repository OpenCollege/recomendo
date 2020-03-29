class Category < ApplicationRecord
  has_many :posts

  scope :by_name, -> { order(name: :asc) }

  def self.names
    all.map{|category| category.name}
  end

  def name_with_icon
    "#{icon} #{name.titleize}"
  end
  
  # def icon
  #   case name
  #   when "livro" then "📘"
  #   when "filme" then "🍿"
  #   when "podcast" then "🎧"
  #   when "seriado" then "📺"
  #   end
  # end
end
