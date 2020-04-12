module CategoriesHelper
  def categories_for_select
    Category.all.map {|category| [category.name_with_icon, category.id]}
  end
end
