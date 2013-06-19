#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy, :resign ]
  before_filter :recent_users

  # GET users/sign_up(.:format) 
  # 会員登録手続き画面表示
  def new

    super
  end

  # GET /resign
  # 退会手続き画面表示
  def resign
    @resignation = Resignation.new # 退会理由テーブルにデータ入れるため
    render :resign
  end

  # DELETE /users
  def destroy
    # 退会理由が記入されてたら保存
    @resignation = Resignation.new( :reason => params[:user][:reason] ).save if params[:user][:reason].present?

    # 会員削除（退会）処理
    super
  end


  # 最近ログインした順に5人取得
  def recent_users
    
    # 既存会員
    @users = User.where("confirmed_at is NOT NULL").order('last_sign_in_at DESC').limit(5)  
  end
end
