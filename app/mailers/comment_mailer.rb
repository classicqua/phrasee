#coding: utf-8
class CommentMailer < ActionMailer::Base

  # 送信者アドレス
  default :from => 'notice@phrasee.jp'

  #Rails.logger.debug "phrase:"

  # メール文作成処理
  def notice_mail(phrase,comment,url)

    @phrase = phrase
    @url = url.gsub(/\/comments/, '')
    @new_comment = comment
    @commenter = User.find(@new_comment.user_id)

    # notice_mail.html.erbに出力（render）
    mail(
      :to => phrase.user.email, 
      :subject => "【Phrasee】新着コメントがあります。"
    )
  end
end
