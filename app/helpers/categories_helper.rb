module CategoriesHelper
  def categories_for_select
    Category.all.pluck(:name,:id)
  end
  def cateries_with_symbols
    
  end
end
