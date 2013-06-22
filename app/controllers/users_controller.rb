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

    # 既存会員
    #@users = User.where("confirmed_at is NOT NULL").order('last_sign_in_at DESC').limit(5)  

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
    @favoriteds = Favorite.where(phrase_id: @user.phrase_ids).uniq

    # お気に入りした人
    #@fav_users = User.where(phrase_id: @user.phrase_ids)

    # 現在のメンバーの内、最近ログインした人たち
    recent_users
  end

  # 投稿フレーズ
  def posts
    begin
      @user = User.find(params[:id])
      @phrases = Phrase.where( 'user_id = :user_id', { :user_id => params[:id] } )
                        .paginate(page:params[:page])
    rescue Exception => e
      flash[:error] = 'データが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    #render :posts;
    respond_to do |format|
      format.html { render :posts }
      format.json { render json: @phrases }
    end
  end

end
