#coding: utf-8
class HomeController < ApplicationController

  def index
    @categories = get_category_all
    @phrases = Phrase.limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)

    # 現在のメンバーの内、最近ログインした人たち
    recent_users

    # ピックアップフレーズ
    @pikup_phrase = Phrase.order('updated_at DESC').first
    @phrase = @pikup_phrase.dup
  end
end
