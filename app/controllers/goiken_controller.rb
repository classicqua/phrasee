#coding: utf-8
class GoikenController < ApplicationController

  def create

    @goiken = Goiken.new
    @goiken.body = params[:body]

    if @goiken.save
      render :result
    else
      #render :text => '何か書いてから送信をお願いします。'
    end
  end
end