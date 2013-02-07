class HomeController < ApplicationController
  def index
    #@users = User.all
    @categories = Category.all
    @phrases = Phrase.order('updated_at DESC').limit(ENV['PH_LIMIT_INDEX_PHRASE_NUM'])
  end
end
