#coding: utf-8
class NewsLetter

  def self.execute
    #Rails.logger.debug "******* CAN YOU SEE MY CRON ? ********"
    #puts("==== cron execute done!!! ====")

    ### MailChimp ###

    # 配信対象者のリスト取得（ メール配信OKの人のメアドリストアップ　）
    @user_list = User.where( mail_flg: true ).map{|e|e.email}
    puts @user_list

    # 配信フレーズ取得

      # メルマガ配信済フレーズテーブル（以下 配信済テーブル）の最後のフレーズのphrase_id取得
        
        # そのidを基点にPhrasesテーブルから5フレーズピックアップ（idを1ずつインクリメント）

          # そのidのフレーズが存在するか？ 存在しない or launch_flg=false の場合次へ
        
        # ただし初回はデータが無いのでphrase_id=1-5をピックアップ 

      # 既に配信済じゃないか？

    # 配信済テーブルにphrase_id追加（sentカラムに日時を入れる）

    # MailChimpにデータを渡す（API）
  end
end