# == Schema Information
#
# Table name: categories
#
#  id            :integer          not null, primary key
#  category_name :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  detail        :text
#

class Category < ActiveRecord::Base
  attr_accessible :category_name, :detail
  has_many :phrases

  validates :category_name, presence:true
end
