class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @phrases = Phrase.where( 'category_id = :category_id', 
                            { :category_id => params[:id] } )
  end
end
