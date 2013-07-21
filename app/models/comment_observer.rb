class CommentObserver < ActiveRecord::Observer
  cattr_accessor :logger       # この中でloggerクラスを直接使えないので、
  self.logger ||= Rails.logger # Railsのloggerを取得して使ってる

  # コメントされたら投稿者へ通知（メール送信）
  def after_save(phrase)
    comment_user = phrase.user # コメントした人
    comment_body = phrase.content # コメント内容

    # チェック用
    #logger.debug("## commented by #{commented_user.email}  !!!!!!! ##") 
    #logger.debug("## mail_flg is #{commented_user.mail_flg} !!!!!!! ##") 
    #logger.debug("## comment_body is #{comment_body} !!!!!!! ##") 

    #@mail = CommentMailer.commented_notice_mail(phrase,comment_user,comment_body).deliver
    #CommentMailer.notice_mail(phrase).deliver

    # メール受取を許可している人にはメール通知
    if comment_user.mail_flg

 
    end
  end
end