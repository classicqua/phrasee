#coding: utf-8
class ConfirmationsController < Devise::ConfirmationsController
  before_filter :authenticate_user!, only: [:registered]

  ## 登録STEP1
  # 1)アカウント設定画面表示
  # 
  # GET /resource/confirmation?confirmation_token=abcdef
  def show
      @confirmation_token = params[:confirmation_token];
      @user = User.find_by_confirmation_token(@confirmation_token)
      if @user.nil?

        redirect_to new_user_session_url
      else
        
        #set_flash_message(:notice, :pre_confirmed)  # 別ページに遷移したとき消えるよう以下に変更 2013.2.5
        flash.now[:notice] = I18n.t "devise.confirmations.pre_confirmed"
        render :show 
      end
  end

  ## 登録STEP2
  # 1)性別などを入力→ 2)usersテーブルの該当レコードUPDATE → 3)成功したらconfirm処理 → 4)エラーなければ登録完了画面へ
  # 
  # PUT /confirm 
  def confirm
    token = params[resource_name][:token_for_confirmation] 
    #logger.debug("## トークン : #{token} ##")
    @user = User.find_by_confirmation_token(token)
    redirect_to new_user_session_url and return if @user.blank? || @user.confirmed? # 本人確認済

    ### update処理用にuserパラメータ整形 ###
    # user[:email]追加
    params[resource_name][:email] = @user.email

    # user[:token_for_confirmation]削除
    lc_token_for_confirm = params[resource_name][:token_for_confirmation].clone
    params[resource_name].delete(:token_for_confirmation)

    ### エラーチェック ###
    if(params[resource_name][:agreement] != "1") # 利用規約に同意してなかったら差し戻す

      #logger.debug('### 利用規約同意してない ###')
      #logger.debug(params[resource_name][:agreement])

      #set_flash_message(:error, :disagree_terms) 
      flash.now[:alert] = I18n.t "devise.confirmations.user.disagree_terms"
      render action:'show', confirmation_token: lc_token_for_confirm # アカウント設定画面にもどる
    else 
    ### アカウント設定処理 ###

      # 2)usersテーブルの該当レコードUPDATE（update_without_passwordメソッドを使う）
      update_successfully_flg = @user.update_without_password(params[resource_name])

      logger.debug('mejimeji ### UPATE結果 update_without_password ###')
      logger.debug(update_successfully_flg)
      
      # 3)成功したらconfirm処理
      if update_successfully_flg 
        
        # 本人確認（confirm） ・・・ すでに認証済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
        self.resource = resource_class.confirm_by_token(lc_token_for_confirm)

        # 4)エラーなければ登録完了画面へ
        if resource.errors.empty?

            set_flash_message(:notice, :confirmed) if is_navigational_format?
            sign_in(resource_name, resource) 
            #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
            respond_with_navigational(resource){ redirect_to registered_url }
        else

          # confirm処理失敗時
          respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
        end
      else 

        # UPDATE失敗時
        flash.now[:alert] = I18n.t "devise.confirmations.user.invalid_account_data"
        render action:'show', confirmation_token: lc_token_for_confirm # アカウント設定画面にエラー表示
      end
    end
  end

  # GET /registerd
  def registered
    @user = current_user 
    # お気に入りされたフレーズ
    @favoriteds = Favorite.where(phrase_id: @user.phrase_ids)
    render :registered
  end


  protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      new_session_path(resource_name)
    end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      after_sign_in_path_for(resource)
    end
end
