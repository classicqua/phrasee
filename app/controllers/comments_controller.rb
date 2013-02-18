#coding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

  def index
   
  end

  # comments POST   /phrases/:id/comments(.:format)   comments#create
  def create
    begin
      @phrase = Phrase.find(params[:id]) # コメント対象のフレーズ
    rescue Exception => e
      flash[:error] = 'コメントを書き込めませんでした。'
      redirect_to root_url
      return
    end
    
    @new_comment = @phrase.comments.new
    @new_comment.content = params[:comment][:content]
    @new_comment.user_id = current_user.id # コメント者のidをセット

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to @phrase, notice: 'コメントを投稿しました。' }
      else
        format.html { render action: "show" }
      end
    end

=begin
    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to phrase_url(@phrase), notice: 'コメントを投稿しました。' }
      #  format.json { render json: phrase_url(@phrase), status: :created, location: phrase_url(@phrase) }
      else
        format.html { redirect_to phrase_url(@phrase) }
      #  format.json { render json: phrase_url(@phrase).errors, status: :unprocessable_entity }
      end
    end
=end
  end
end
