#coding: utf-8
class PhrasesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.paginate(page:params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phrases }
    end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    @phrase = Phrase.find(params[:id]) # フレーズ
    @user = current_user # このフレーズを見てる人

    # 現在このフレーズについてるコメントたち
    @comments = Comment.where( 'phrase_id = :phrase_id', { :phrase_id => @phrase } ) 

    # 新規コメント用
    @new_comment = @phrase.comments.new 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/new
  # GET /phrases/new.json
  def new
    @phrase = Phrase.new
    @categories = get_category_all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/1/edit
  def edit
    @phrase = Phrase.find(params[:id])
    @categories = get_category_all
  end

  # POST /phrases
  # POST /phrases.json
  def create
    @phrase = current_user.phrases.build(params[:phrase])

    respond_to do |format|
      if @phrase.save
        format.html { redirect_to @phrase, notice: '新規フレーズを投稿しました。' }
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
        format.html { redirect_to @phrase, notice: 'フレーズを更新しました。' }
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
