#coding: utf-8
class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create]

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

        # 「コメントされた」旨のお知らせメール送信（メール配信フラグfalseの人には送られない）
        CommentMailer.notice_mail(@phrase,@new_comment,request.url).deliver if @phrase.user.mail_flg
      else
        format.html { render action: "show" }
      end
    end
  end
end
