class HomeController < ApplicationController
  def index
    @categories = Category.all
    #@phrases = Phrase.order('updated_at DESC').limit(ENV['PH_LIMIT_INDEX_PHRASE_NUM'])
    @phrases = Phrase.order('updated_at DESC').limit(5) # 定数ファイルで管理できるよう変更予定
  end
end
