#coding: utf-8

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  profile_image          :string(255)
#  introduction           :text
#  gender                 :integer
#  birth                  :date
#  country                :string(255)
#  postal_code            :string(255)
#  mail_flg               :boolean
#

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :agreement,
                  :profile_image, :introduction, :gender, :birth, :country, :postal_code, :mail_flg

  has_many :phrases, dependent: :destroy
  has_many :comments, dependent: :destroy

  # プロフィール画像アップローダー
  mount_uploader :profile_image, ProfileImageUploader
  #validates_presence_of :profile_image # プロフィール画像は任意なのでコメントアウト
  #validates_integrity_of :profile_image
  validates_processing_of :profile_image

  ## 本人確認メール送信前に登録する情報
  validates :name,  presence:true, length:{ minimum:1, maximum:16 }
  validates :email, presence:true, length:{ minimum:1, maximum:100 }
  #validates :encrypted_password, presence:true

### 以下のカラムは「更新」のときだけ必須にする（本人確認のときは登録しないので） ###

  ## 本人確認後に登録する情報（=UPDATEする）

  # 公開情報
  #validates :profile_image, presence:true
  validates :introduction, length:{ maximum:255 }
  
  # 非公開アカウント情報
  validates :gender, presence:true, on: :update
  validates :birth, presence:true, on: :update
  validates :country, presence:true, on: :update
  validates :postal_code, presence:true, :if => :need_postal_code?,
                           length:{ minimum:7, maximum:8 }, on: :update
  #validates :mail_flg, presence:true, on: :update

  # 利用規約への同意フラグ（カラムなし）
  validates_acceptance_of :agreement
  

  def need_postal_code?
    self.country.downcase == "japan" # 日本在住者は郵便番号必須
  end

### クエリ関連 ###
  self.per_page = Constants.PH_PAGINATION.PER_PAGE || 10
  default_scope order: 'users.updated_at DESC'
end
