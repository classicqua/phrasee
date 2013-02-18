#coding: utf-8
class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.paginate(page:params[:page], per_page:10)
  end

  def show
    begin
      @user = User.find(params[:id]) # 該当ユーザー
    rescue Exception => e
    #rescue ActiveRecord::RecordNotFound  # URLにユーザー番号打ち込んだときなど
      flash[:error] = 'メンバーのプロフィールが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    # お気に入りされたフレーズ
    @favoriteds = Favorite.where(phrase_id: @user.phrase_ids)
  end

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
