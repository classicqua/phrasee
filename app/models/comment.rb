# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  phrase_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :content, :phrase_id, :user_id
  belongs_to :phrase
  belongs_to :user

  validates :content, presence:true, 
            length:{ minimum:1, maximum:250 }
  validates :phrase_id, presence:true
  validates :user_id, presence:true
end
