#coding: utf-8
class ServiceController < ApplicationController

  # ガイド ： Phraseeとは？
  def guide
    
    # 現在のメンバーの内、最近ログインした人たち
    recent_users
  end

  # ヘルプ
  def help
  end

  # 利用規約
  def terms
    #@lines = File.readlines("_disclaimers.txt")
    @lines = Constants.MENSEKI
  end

  # 免責事項
  def disclaimer
    @lines = Constants.MENSEKI
  end

  # プライバシーポリシー
  def privacy
    
  end

  ## --- ###
  # お問い合わせ
  def contact
  end

  # 運営者情報
  def about
  end

  # お知らせ
  def info
  end
end
