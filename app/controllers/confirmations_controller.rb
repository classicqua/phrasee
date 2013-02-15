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
        
        #flash.now[:notice] = I18n.t "devise.confirmations.pre_confirmed"
        #render :show 

        self.resource = resource_class.confirm_by_token(@confirmation_token)
        sign_in @user
        redirect_to edit_user_registration_url(@user)
      end
  end

  # PUT /confirm 
  def confirm
    @user = User.find_by_confirmation_token(params[resource_name][:token_for_confirmation])

    ### （1）エラーチェック ###

    # 利用規約に同意してるかチェック
    if params[:agreement].nil?
      set_flash_message(:error, :disagree_terms) 
      redirect_to :back # アカウント設定画面にもどる
    
    else 
    ### （2）アカウント設定処理 ###

      # 本人確認（confirm） ・・・ すでに認証済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
      self.resource = resource_class.confirm_by_token(params[resource_name][:token_for_confirmation])
      
      # 残ってるとupdateでエラーになるので削除
      lc_token_for_confirm = params[resource_name][:token_for_confirmation].clone
      params[resource_name].delete(:token_for_confirmation)

      # アカウント設定で入力した情報をセット（ユーザー情報更新）
      if resource.errors.empty?
        set_flash_message(:notice, :confirmed) if is_navigational_format?
        sign_in(resource_name, resource) 
        respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 
       
        ## リダイレクト ###
        #redirect_to controller:'registrations', action:'update', status: 302  and return
        #respond_with_navigational(resource){ redirect_to controller:'registrations', action:'update', status: 302 } 

=begin
        ### userカラム更新（プロフィール情報などをuserテーブルのアカウント情報関連カラムにセット） ###
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
=end

  ### 追加1
        # プロフィール等をセット

        # 残ってるとupdateでエラーになるので削除
        #params[resource_name].delete(:token_for_confirmation)

        #if resource.update_attributes(params[resource_name])
  ### ここまで

          #respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 

  ### 追加2
        #else
        #  respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
        #end
  ### ここまで

      else
        respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
      end
    end

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
