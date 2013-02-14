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

=begin
    file = params[:upfile]
    name = file.original_filename # ファイル名取得
    perms = ['.jpg', '.jpeg', '.gif', '.png']
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのはjpg、gif、png形式の画像ファイルのみです。'
    elsif file.size > 1.megabyte
      result = 'アップロードできるファイルサイズは1MBまでです。'
    else
      File.open("#{Rails.root}/app/assets/images/user_images/#{name}", wb){ |f| f.write(file.read) }
      #result = "#{name.toutf8}をアップロードしました"
      result = "画像をアップロードしました"
    end

    render :show => result and return true ### 一時的にここでとめる

=end
    ### （1）エラーチェック ###

    # 利用規約に同意してるかチェック
    if params[:agreement].nil?
      set_flash_message(:error, :disagree_terms) 
      redirect_to :back # アカウント設定画面にもどる
    
    else 
    ### （2）ユーザー登録処理 ###

      # ユーザー登録処理 ・・・ すでに登録済の人がアクセスしたときのエラー処理もこのメソッドがやってくれる
      self.resource = resource_class.confirm_by_token(params[resource_name][:token_for_confirmation])

      # アカウント設定で入力した情報をセット（ユーザー情報更新）
      if resource.errors.empty?
        set_flash_message(:notice, :confirmed) if is_navigational_format?
        sign_in(resource_name, resource)    

  ### 追加1
        # プロフィール等をセット

        # 残ってるとupdateでエラーになるので削除
        #params[resource_name].delete(:token_for_confirmation)

        #if resource.update_attributes(params[resource_name])
  ### ここまで
          respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) } 

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
