#coding: utf-8
module CategoryHelper
  def get_category_all
    categories = Category.all

    # カテゴリー並び順：「その他」が最後に来るように並べ替え
    tmp = Array.new(0)
    categories.each do |category|
      tmp.push(category) if category.category_name == "その他" && category.id.to_i < Category.count
    end
    categories[tmp.first.id-1], categories[Category.count-1] = categories[Category.count-1], categories[tmp.first.id-1]  unless tmp == []
    return categories
  end
end
