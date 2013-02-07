class HomeController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)
  end
end
