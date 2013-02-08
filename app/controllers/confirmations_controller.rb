class ConfirmationsController < Devise::ConfirmationsController

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
      @confirmation_token = params[:confirmation_token];
      @user = User.find_by_confirmation_token(@confirmation_token)
      unless @user.nil?
        #set_flash_message(:notice, :pre_confirmed)  # 別ページに遷移したとき消えるよう以下に変更 2013.2.5
        flash.now[:notice] = I18n.t "devise.confirmations.pre_confirmed"
        render :show   
      end
  end

  # PUT /confirm 
  def confirm

    self.resource = resource_class.confirm_by_token(params[resource_name][:token_for_confirmation])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :show }
    end    
  end
end
