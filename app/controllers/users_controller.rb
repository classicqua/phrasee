#coding: utf-8
class UsersController < ApplicationController
  #before_filter :authenticate_user!

  # メンバー一覧
  def index
    # 本人確認済の人だけ一覧表示
    @users = User.where("confirmed_at is NOT NULL").paginate(page:params[:page], per_page:10)
  end

  # メンバーページ
  def show

    # フレーズブックのメンバー
    begin
      @user = User.find(params[:id]) # 該当ユーザー
    rescue Exception => e
    #rescue ActiveRecord::RecordNotFound  # URLにユーザー番号打ち込んだときなど
      flash[:error] = 'メンバーのプロフィールが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    # 投稿したフレーズ
    @phrases = @user.phrases.paginate(page:params[:page], per_page:3)

    # お気に入りされたフレーズ
    @favoriteds = Favorite.where(phrase_id: @user.phrase_ids)
    
    # 【ボツ】複数人がお気に入りしててもそれぞれ「1回」でカウントしたものを抽出
    #@favoriteds_uniq = @favoriteds.map{|f|f}.uniq{|fu|fu.phrase_id} # 以下改良版に差し替え

    # 【改良版】お気に入り数でグループ化してuser数順かつ新しいもの順にソートしたもの
    #@favoriteds_uniq = @favoriteds.group('phrase_id').order('count_phrase_id DESC, created_at ASC').count('phrase_id').keys.map{|f|Favorite.where(phrase_id: f)[0]}
    @favoriteds_uniq = @favoriteds.group('phrase_id').order('count_phrase_id DESC, created_at ASC').count('phrase_id').map{|k,v|Favorite.where(phrase_id:k).uniq(k)[0]}

    # お気に入りした人
    #@fav_users = User.where(phrase_id: @user.phrase_ids)

    # 投稿フレーズの合計pv数
    @pv_count = @user.phrases.map{|p|p.pv}.inject(0){ |sum, pv| sum += pv }

    # 現在のメンバーの内、最近ログインした人たち
    recent_users
  end

  # 投稿フレーズ
  def posts
    begin
      @post_user = User.find(params[:id])
      @target_phrases = Phrase.where( 'user_id = :user_id', { :user_id => params[:id] } )
                        .paginate(page:params[:page])
    rescue Exception => e
      flash[:error] = 'データが見つかりませんでした。' 
      redirect_to root_url
      return
    end
  end

end
