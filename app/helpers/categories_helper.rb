module CategoriesHelper
  def categories_for_select
    Category.all.map{|category|[category.name,category.id]}
  end
end
