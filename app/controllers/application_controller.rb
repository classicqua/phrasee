#coding: utf-8
class ApplicationController < ActionController::Base
  include CategoryHelper
  
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
