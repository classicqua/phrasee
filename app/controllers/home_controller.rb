#coding: utf-8
class HomeController < ApplicationController
  #before_filter :set_search_form
  
  def index
    @categories = get_category_all
    @phrases = Phrase.limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)

    # 現在のメンバーの内、最近ログインした人たち
    recent_users

    # ピックアップフレーズ
    @pikup_phrase = Phrase.first
    @phrase = @pikup_phrase.dup unless @pikup_phrase.blank?
  end
end
