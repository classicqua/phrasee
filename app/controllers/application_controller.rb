#coding: utf-8
class ApplicationController < ActionController::Base
  include CategoryHelper

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  # ログイン後、デフォルトはマイブック表示（deviseのヘルパーをオーバーライド）
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || user_path(current_user)
  end

  # 現在のメンバーの内、最近ログインした人たち
  def recent_users
    
    @recent_users = User.where("confirmed_at is NOT NULL").order('last_sign_in_at DESC').limit(3)
  end
end
