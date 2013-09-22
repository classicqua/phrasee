#coding: utf-8
class HomeController < ApplicationController
  #before_filter :set_search_form
  
  def index
    @categories = get_category_all
    @phrases = Phrase.paginate(page:params[:page]).limit(Constants.PH_LIMIT_INDEX_PHRASES_NUM)

    # 現在のメンバーの内、最近ログインした人たち
    recent_users

    # ピックアップフレーズ
    @pikup_phrase = Phrase.first
    @phrase = @pikup_phrase.dup unless @pikup_phrase.blank?

    # アクセス数TOP3
    @users = User.all.sort_by{|user| -user.phrases.map{|p|p.pv}.sum}
    #@users = User.all.sort_by{|user|user.phrases.map{|p|p.pv}.inject(0){ |sum, pv| sum += pv }}[1..3]

  end
end
