class Category < ApplicationRecord
  scope :by_name, -> { order(name: :asc) }
  def self.names
    all.map{|category| category.name}
  end
  def name_with_icon
    case name
    when "livro" then "Livro 📘"
    when "filme" then "Filme 🍿"
    when "podcast" then "Podcast 🎧"
    when "seriado" then "Seriado 📺"
    else name
    end
  end
  def icon
    case name
    when "livro" then "📘"
    when "filme" then "🍿"
    when "podcast" then "🎧"
    when "seriado" then "📺"
    end
  end
end
