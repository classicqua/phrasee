# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  phrase_id  :integer
#  delete_flg :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorites < ActiveRecord::Base
  attr_accessible :delete_flg, :phrase_id, :user_id
  belongs_to :user
  belongs_to :phrase
end
