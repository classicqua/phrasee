#coding: utf-8
class HomeController < ApplicationController

  def index
    @categories = get_category_all
    @phrases = Phrase.limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)
  end
end
