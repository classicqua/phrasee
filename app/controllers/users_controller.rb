class UsersController < ApplicationController
  #before_filter :authenticate_user!

  def index
    @users = User.paginate(page:params[:page], per_page:10)
  end

  def show
    @user = User.find(params[:id])
  end

  def posts
    @user = User.find(params[:id])
    @phrases = Phrase.where( 'user_id = :user_id', { :user_id => params[:id] } )
                    .paginate( page:params[:page], per_page:10 )

    render :posts;
=begin
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phrases }
    end
=end
  end
end
