class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.paginate(page:params[:page], per_page:10)
  end

  def show
    @user = User.find(params[:id])

    # お気に入りされたフレーズ
    @favoriteds = Favorite.where(phrase_id: @user.phrase_ids)
  end

  def posts
    @user = User.find(params[:id])
    @phrases = Phrase.where( 'user_id = :user_id', { :user_id => params[:id] } )
                      .paginate(page:params[:page])

    #render :posts;
    respond_to do |format|
      format.html { render :posts }
      format.json { render json: @phrases }
    end
  end
end
