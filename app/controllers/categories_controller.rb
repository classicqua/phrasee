#coding: utf-8
class CategoriesController < ApplicationController
  def index
    @categories = get_category_all
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    begin
      @category = Category.find(params[:id])
    rescue Exception => e
    #rescue ActiveRecord::RecordNotFound  # URLに番号を打ち込んだときなど
      flash[:error] = 'カテゴリーが見つかりませんでした。' 
      redirect_to root_url
      return  
    end

    @phrases = Phrase.where( 'category_id = :category_id', { :category_id => params[:id] } )
                    .paginate( page:params[:page], per_page:10 )
  end
end
