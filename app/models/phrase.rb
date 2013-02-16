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
#  launch_flg  :boolean
#

class Phrase < ActiveRecord::Base
  attr_accessible :japanese, :english, :source, :story, :launch_flg, :category_id, :source, :story, :launch_flg
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :japanese, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :english, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :user_id, presence:true
  validates :category_id, presence:true
  validates :source, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :story, presence:true, 
            length:{ minimum:1, maximum:100 }


  self.per_page = Constants.PH_PAGINATION.PER_PAGE || 10
  default_scope order: 'phrases.updated_at DESC'
end
