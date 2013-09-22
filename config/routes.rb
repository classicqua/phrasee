Phrasee::Application.routes.draw do

### 共通 ###

  # ログイン有無でroot_pathを振り分け
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"


### ユーザー（会員）用 ###

  # deviseによるユーザー認証ルート構成
  devise_for :admin_users,
             :users, 
             :controllers => {
                :confirmations => 'confirmations',  # オーバーライドしたConfirmationsControllerを使う
                :registrations => 'registrations'   # オーバーライドしたRegistrationsControllerを使う
             }

  # deviseカスタマイズ
  devise_scope :user do
    put "/confirm" => "confirmations#confirm" # 本人確認処理（仮登録のレコードを更新）
    get "/registered" => "confirmations#registered" # アカウント設定完了画面表示
    get "/resign" => "registrations#resign" # 退会手続きページ表示
  end

  # 会員登録したユーザー
  resources :users do
    member do
      get :posts # 各userが投稿したフレーズ
      resources :favorites, only: [:index, :create, :update, :destroy] # 各userのお気に入りフレーズ
    end
  end

### Adminユーザー（管理者）用 ###
  #devise_for :admin_users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

### フレーズ用 ###

  # 英語フレーズ
  resources :phrases do
    member do
      resources :comments, only: [:create]
    end
    collection do
      match 'search' => 'phrases#search', via: [:get, :post], as: :search # フレーズ検索
    end
  end

  # フレーズのカテゴリー　
  resources :categories, only: [:index, :show]
  

### 運営用 ###

  # ご意見フォーム
  post "goiken/create"

  # サービス運営
  match '/guide',       to: 'service#guide', via: :get
  match '/help',        to: 'service#help', via: :get
  match '/terms',       to: 'service#terms', via: :get
  match '/disclaimer',  to: 'service#disclaimer', via: :get
  match '/privacy',     to: 'service#privacy', via: :get
  match '/about',       to: 'service#about', via: :get
  match '/contact',     to: 'service#contact', via: :get
  match '/info',        to: 'service#info', via: :get
end
