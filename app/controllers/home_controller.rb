#coding: utf-8
class HomeController < ApplicationController

  def index
    @categories = get_category_all
    @phrases = Phrase.limit(Constants.PH_LIMIT_INDEX_PHRASE_NUM)

    # 現在のメンバーの内、最近ログインした人たち
    @users = User.where("confirmed_at is NOT NULL").order('last_sign_in_at DESC').limit(3)
  end
end
