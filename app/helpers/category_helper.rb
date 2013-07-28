#coding: utf-8
module CategoryHelper

  # 以下のmy_categoriesで指定した順にカテゴリーを並べ替えたレコードを返す
  def get_category_all


    ct = [] # 並び替えたカテゴリーレコード一覧
    my_categories = [
     "あいさつ・日常会話",
     "旅行",
     "ホテル",
     "空港",
     "レストラン",
     "お買い物",
     "映画",
     "本",
     "音楽",
     "ビジネス",
     "コンピュータ",
     "子育て",
     "名言",
     "おもしろネタ",
     "その他"
    ].each do |c|
      ct.push(Category.find_by_category_name(c))
    end
    return ct
=begin
    Category.all
=end
  end
end
