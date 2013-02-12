# == Schema Information
#
# Table name: resignations
#
#  id         :integer          not null, primary key
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resignation < ActiveRecord::Base
  attr_accessible :reason
end
