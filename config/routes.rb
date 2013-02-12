Phrasee::Application.routes.draw do

  #get "comments/new"

  # ログイン有無でroot_pathを振り分け
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"

  #devise_for :users
  devise_for :users, 
             :controllers => {
                :confirmations => 'confirmations',  # オーバーライドしたConfirmationsControllerを使う
                :registrations => 'registrations'   # オーバーライドしたRegistrationsControllerを使う
             }

  # PUT で userモデルのconfirm_atを「確認完了」に
  devise_scope :user do
    put "/confirm" => "confirmations#confirm" # 本人確認処理完了
    get "/resign" => "registrations#resign" # 退会手続きページ表示
  end

  resources :users do
    member do
      get :posts # 各userが投稿したフレーズ
    end
  end

  resources :phrases do
    member do
      resources :comments, only: [:create]
    end
    #resources :comments, only: [:create]
  end

  resources :categories, only: [:index, :show]

  # サービス運営
  match '/guide',       to: 'service#guide', via: :get
  match '/help',        to: 'service#help', via: :get
  match '/terms',       to: 'service#terms', via: :get
  match '/disclaimer',  to: 'service#disclaimer', via: :get
  match '/privacy',     to: 'service#privacy', via: :get
  match '/about',       to: 'service#about', via: :get
  match '/contact',     to: 'service#contact', via: :get
end
