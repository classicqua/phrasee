#coding: utf-8
class FavoritesController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :update]

  def new

  end

  # お気に入りへ追加
  # POST /users/123/favorites
  def create

    @favorite = current_user.favorites.build(params[:favorite])
    if @favorite.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'phrases/show'
    end

=begin
    @phrase = Phrase.find(params[:id]) # お気に入り対象のフレーズ

    @new_favorite = @phrase.comments.new
    @new_favorite.phrase_id = params[:favorite][:phrase_id]
    @new_favorite.user_id = current_user.id # コメント者のidをセット

    respond_to do |format|
      if @new_favorite.save
        format.html { redirect_to @phrase, notice: 'お気に入りに追加しました。' }
      else
        format.html { render action: "show" }
      end
    end
=end
  end

  # お気に入りから削除
  # PUT 
  def update
    
  end
end
