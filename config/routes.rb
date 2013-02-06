Phrasee::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  # Devise::ConfirmationsControllerをオーバーライドして使う
  #devise_for :users

  devise_for :users, 
             :controllers => {:confirmations => 'confirmations'}

  # PUT で userモデルのconfirm_atを「確認完了」に
  devise_scope :user do
    put "/confirm" => "confirmations#confirm"
  end

  resources :users
end