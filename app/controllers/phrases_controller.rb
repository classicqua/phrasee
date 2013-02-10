#coding: utf-8
class PhrasesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.paginate(page:params[:page], per_page:10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phrases }
    end
=begin
=end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    @user = current_user
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/new
  # GET /phrases/new.json
  def new
    @phrase = Phrase.new
    @categories = Category.all

    # カテゴリー並び順：「その他」が最後に来るように並べ替え
    tmp = Array.new(0)
    @categories.each do |category|
      tmp.push(category) if category.category_name == "その他" && category.id.to_i < Category.count
    end
    @categories[tmp.first.id-1], @categories[Category.count-1] = @categories[Category.count-1], @categories[tmp.first.id-1]  unless tmp == []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/1/edit
  def edit
    @phrase = Phrase.find(params[:id])
  end

  # POST /phrases
  # POST /phrases.json
  def create
    # @phrase = Phrase.new(params[:phrase])
    @phrase = current_user.phrases.build(params[:phrase])

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: 'Phrase was successfully created.' }
        format.json { render json: @phrase, status: :created, location: @phrase }
      else
        format.html { render action: "new" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    @phrase = Phrase.find(params[:id])

    respond_to do |format|
      if @phrase.update_attributes(params[:phrase])
        format.html { redirect_to @phrase, notice: 'Phrase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phrase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    @phrase = Phrase.find(params[:id])
    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to phrases_url }
      format.json { head :no_content }
    end
  end
end
