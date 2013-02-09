class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    @phrases = Phrase.where( 'category_id = :category_id', 
                            { :category_id => params[:id] } )
  end
end
