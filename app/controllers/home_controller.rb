class HomeController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.order('updated_at DESC').limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)
  end
end
