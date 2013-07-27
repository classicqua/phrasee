#coding: utf-8
class PhrasesController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /phrases
  # GET /phrases.json
  def index
    @phrases = Phrase.paginate(page:params[:page])
    
    # 現在のメンバーの内、最近ログインした人たち
    recent_users

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phrases }
    end
  end

  # GET /phrases/1
  # GET /phrases/1.json
  def show
    begin
      @phrase = Phrase.find(params[:id]) # フレーズ
    rescue Exception => e
      flash[:error] = 'フレーズが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    @user = current_user # このフレーズを見てる人

    # 現在このフレーズについてるコメントたち
    @comments = Comment.where( 'phrase_id = :phrase_id', { :phrase_id => @phrase } ) 

    # 新規コメント用
    @new_comment = @phrase.comments.new 

    ### 同じカテゴリーのフレーズ（次へリンク用） ###
    @phrases = Phrase.where( 'category_id = :category_id', { :category_id => @phrase.category.id } )
    current_flg = FALSE
    @next = nil
    @phrase_ids = @phrases.map{|p|p.id} # 同カテゴリーのフレーズのid抽出
    @phrase_ids.each do |pid|
      if current_flg
        @next = Phrase.find(pid) 
        current_flg = FALSE;
      else
        current_flg = TRUE if pid == @phrase.id 
        # ☆最後まで進んだとき最初に戻るなら⬇をコメントイン
        @next = Phrase.find(@phrase_ids.first)  if (@phrase_ids.count > 1) && @next == nil
      end   
    end    
    ### 次へリンク用/ココまで ###

    # pv数インクリメント
    pv_count = @phrase.pv + 1
    @phrase.update_attribute(:pv, pv_count)

    # 現在のメンバーの内、最近ログインした人たち
    recent_users

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/new
  # GET /phrases/new.json
  def new
    @phrase = Phrase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phrase }
    end
  end

  # GET /phrases/1/edit
  def edit
    begin
      @phrase = Phrase.find(params[:id])
      @categories = get_category_all
    rescue Exception => e # 存在しないフレーズを編集しようとしたとき
      flash[:error] = 'データが見つかりませんでした。' 
      redirect_to root_url
      return
    end
  end

  # POST /phrases
  # POST /phrases.json
  def create

    # 利用規約への同意チェック
    if(params[:phrase][:agreement] != "1") # 利用規約に同意してなかったら差し戻す
      flash.now[:error] = '利用規約に同意いただけない場合、投稿はご遠慮ください。'
      params[:phrase].delete(:agreement)
      @phrase = Phrase.new(params[:phrase]) # modelオブジェクトを作り直して値をつめる
      render action: "new" and return
    else 
    # 新規フレーズ登録へ
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
  end

  # PUT /phrases/1
  # PUT /phrases/1.json
  def update
    # 利用規約への同意チェック
    if(params[:phrase][:agreement] != "1") # 利用規約に同意してなかったら差し戻す
      flash[:error] = '利用規約に同意いただけない場合、投稿はご遠慮ください。'
      redirect_to :back # ★createと同じ方式ではうまく動かないので取り急ぎこの形で対処。
    else 
    # 新規フレーズ登録へ
      begin
        @phrase = Phrase.find(params[:id])
      rescue Exception => e # 存在しないフレーズを更新しようとしたとき
        flash[:error] = 'データが見つかりませんでした。' 
        redirect_to root_url
        return
      end

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
  end

  # DELETE /phrases/1
  # DELETE /phrases/1.json
  def destroy
    begin
      @phrase = Phrase.find(params[:id])
    rescue Exception => e # 存在しないフレーズを削除しようとしたとき
      flash[:error] = 'データが見つかりませんでした。' 
      redirect_to root_url
      return
    end

    @phrase.destroy

    respond_to do |format|
      format.html { redirect_to posts_user_url(current_user) }
      format.json { head :no_content }
    end
  end
end
