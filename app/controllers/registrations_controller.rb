#coding: utf-8
class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy, :resign ]

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
end
