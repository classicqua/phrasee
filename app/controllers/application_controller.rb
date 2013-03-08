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
end
