#coding: utf-8
class ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
      @confirmation_token = params[:confirmation_token];
      @user = User.find_by_confirmation_token(@confirmation_token)
      if @user.nil?
        redirect_to new_user_session_path
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
    # 利用規約に同意してるかチェック
    if params[:agreement].nil?

      set_flash_message(:error, :disagree_terms) 
      redirect_to action:'show', confirmation_token: lc_token_for_confirm
    else 
    ### （2）アカウント設定処理 ###

      # 本人確認（confirm） ・・・ すでに認証済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
      self.resource = resource_class.confirm_by_token(lc_token_for_confirm)
      sign_in @user

      ## update_without_passwordメソッドを使う場合
      update_successfully_flg = @user.update_without_password(params[resource_name])
      if update_successfully_flg 

        #set_flash_message :notice, :updated
        #sign_in @user, :bypass => true
        #redirect_to after_update_path_for(@user)
        
        set_flash_message(:notice, :confirmed) if is_navigational_format?
        sign_in(resource_name, resource) 
        respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 
      else 

        redirect_to action:'show', confirmation_token: lc_token_for_confirm
      end

=begin ## registrationControllerのupdateアクションで更新する場合
      # required for settings form to submit when password is left blank
      if params[resource_name][:password].blank?
        params[resource_namerce_name].delete("password")
        params[resource_name].delete("password_confirmation")
      end

      #params[:_method] = "put"
      redirect_to controller:'registrations', action:'update', confirmation_token: lc_token_for_confirm
=end
    end

=begin
    ### （1）エラーチェック ###

    # 利用規約に同意してるかチェック
    if params[:agreement].nil?
      set_flash_message(:error, :disagree_terms) 
      #redirect_to :back # アカウント設定画面にもどる
      flash[:confirmation_token] = lc_token_for_confirm
      redirect_to action:'show'
    else 
    ### （2）アカウント設定処理 ###

      # 本人確認（confirm） ・・・ すでに認証済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
      self.resource = resource_class.confirm_by_token(params[resource_name][:token_for_confirmation])
      


      # アカウント設定で入力した情報をセット（ユーザー情報更新）
      if resource.errors.empty?
        #set_flash_message(:notice, :confirmed) if is_navigational_format?
        sign_in(resource_name, resource) 
        #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 
       
        ### userカラム更新（プロフィール情報などをuserテーブルのアカウント情報関連カラムにセット） ###

        ## 前処理
        # required for settings form to submit when password is left blank
        if params[:user][:password].blank?
          params[:user].delete("password")
          params[:user].delete("password_confirmation")
        end

        @user = User.find(current_user.id)
        if @user.update_attributes(params[:user])
          set_flash_message :notice, :updated
          # Sign in the user bypassing validation in case his password changed
          sign_in @user, :bypass => true
          redirect_to after_update_path_for(@user)
        else
          render "edit"
        end


        ## 本処理
        self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
        prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

        if resource.update_with_password(resource_params)
          if is_navigational_format?
            flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
              :update_needs_confirmation : :updated
            set_flash_message :notice, flash_key
          end
          sign_in resource_name, resource, :bypass => true

          respond_with resource, :location => after_update_path_for(resource) 
          #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 
        else
          #clean_up_passwords resource
          #respond_with resource

          # 2013.2.15追加
          set_flash_message(:error, :password_problem_for_account) 
          redirect_to :back # アカウント設定画面にもどる
        end
        ######


         #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 

      else
        respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
      end
    end
=end
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
