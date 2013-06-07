#coding: utf-8
# == Schema Information
#
# Table name: phrases
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  japanese    :string(255)
#  english     :string(255)
#  user_id     :integer
#  category_id :integer
#  source      :string(255)
#  story       :text
#  launch_flg  :boolean          default(TRUE)
#

#coding: utf-8
class Phrase < ActiveRecord::Base
  attr_accessible :japanese, :english, :source, :story, :launch_flg, :category_id, :source, :story, :launch_flg, :agreement
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #has_many :users, through: :favorites

  validates :japanese, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :english, presence:true, 
            length:{ minimum:1, maximum:100 }
            
  validates :user_id, presence:true
  validates :category_id, presence:true
  validates :source, length:{ maximum:500 }
  validates :story, presence:true, 
            length:{ minimum:1, maximum:1200 }

  ## 正規表現 ##
  validates_format_of :japanese, :with => /[\p{Han}\p{Hiragana}\p{Katakana}]/i, :message => "日本語は全角文字で入力してください。"
  validates_format_of :english,  :without => /[\p{Han}\p{Hiragana}\p{Katakana}]/i, :message => "英語は半角英数で入力してください。"


  # 利用規約への同意フラグ（カラムなし）
  validates_acceptance_of :agreement, :message => "利用規約に同意いただけない場合、投稿はご遠慮ください。"

  ## クエリ関連 ##
  self.per_page = Constants.PH_PAGINATION.PER_PAGE || 10
  default_scope order: 'phrases.updated_at DESC'
end
