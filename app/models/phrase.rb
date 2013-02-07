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
  attr_accessible :japanese, :english, :source, :story, :launch_flg, :category_id
  belongs_to :user
  belongs_to :category
=begin
  validates :japanese, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :english, presence:true, 
            length:{ minimum:1, maximum:100 }
  validates :user_id, presence:true
  validates :category_id, presence:true
=end

  default_scope order: 'phrases.updated_at DESC'
end
