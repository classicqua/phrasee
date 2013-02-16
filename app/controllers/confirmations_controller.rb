#coding: utf-8
class ConfirmationsController < Devise::ConfirmationsController

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

  # PUT /confirm 
  def confirm
    @user = User.find_by_confirmation_token(params[resource_name][:token_for_confirmation])
    params[resource_name][:email] = @user.email

    # user[:token_for_confirmation]が残ってるとupdateでエラーになるので削除
    lc_token_for_confirm = params[resource_name][:token_for_confirmation].clone
    params[resource_name].delete(:token_for_confirmation)

    ### （1）エラーチェック ###
    if(params[resource_name][:agreement] != "1") # 利用規約に同意してなかったら差し戻す

      logger.debug('toritori')
      logger.debug(params[resource_name][:agreement])

      set_flash_message(:error, :disagree_terms) 
      redirect_to action:'show', confirmation_token: lc_token_for_confirm # アカウント設定画面にもどる
    else 
    ### （2）アカウント設定処理 ###

      # 本人確認（confirm） ・・・ すでに認証済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
      self.resource = resource_class.confirm_by_token(lc_token_for_confirm)
      sign_in @user


      if resource.errors.empty?

        ## update_without_passwordメソッドを使う
        update_successfully_flg = @user.update_without_password(params[resource_name])
        logger.debug('mejimeji')
        logger.debug(update_successfully_flg)
        logger
        
        if update_successfully_flg 
          
          

          #set_flash_message :notice, :updated
          #sign_in @user, :bypass => true

          set_flash_message(:notice, :confirmed) if is_navigational_format?
          #sign_in(resource_name, resource) 
          
          respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
          #respond_with_navigational(resource){ redirect_to action: 'registered'  }
        else 

          # UPDATE失敗時
          #redirect_to action:'show', confirmation_token: lc_token_for_confirm
          redirect_to :back
        end
      else

        respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
      end
    end
  end

  def registered
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
