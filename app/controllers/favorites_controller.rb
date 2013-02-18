#coding: utf-8
class FavoritesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update, :destroy]

  # user_id = :id のユーザーのお気に入りフレーズ一覧表示
  # GET    /users/:id/favorites(.:format) 
  def index
    begin
      @user = User.find(params[:id])
    rescue Exception => e
      flash[:error] = 'データが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    # このユーザーのお気に入りフレーズ
    @phrases = Phrase.where(id:@user.favorites.map{|fav| fav.phrase_id}).paginate(page:params[:page])
  end

  # お気に入りへ追加
  # POST   /users/:id/favorites(.:format)
  def create
    @phrase = Phrase.find(params[:favorite][:phrase_id]) 

    begin
      # 二重登録防止
      count = Favorite.where( 'phrase_id = :phrase_id AND user_id = :user_id', { phrase_id: @phrase.id, user_id: current_user.id } ).count  
    rescue Exception => e
      if count > 0
        flash[:error] = 'お気に入りに追加できませんでした。'
        redirect_to @phrase
        return
      end  
    end

    # お気に入り追加
    current_user.favorite_on!(@phrase)

    respond_to do |format|
      format.html { redirect_to @phrase, notice: 'お気に入りに追加しました。' }
      format.js
    end
  end

  # PUT    /users/:id/favorites/:id(.:format)
  def update
    
  end

  # お気に入りから削除
  # DELETE /users/:id/favorites/:id(.:format) 
  def destroy
    begin
      @favorite = current_user.favorites.find_by_phrase_id(params[:favorite][:phrase_id])  
      @phrase = Phrase.find(@favorite.phrase_id) # リダイレクト用
    rescue Exception => e # 存在しないfavoriteを削除しようとしたときなど
      flash[:error] = 'お気に入りから削除できませんでした。'
      redirect_to @phrase
      return
    end   

    # お気に入りから削除
    current_user.favorite_off!(@favorite)

    respond_to do |format|
      format.html { redirect_to @phrase, notice: 'お気に入りから削除しました。' }
      format.js
    end
  end
end
