# == Schema Information
#
# Table name: goikens
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

#coding: utf-8

class Goiken < ActiveRecord::Base
  attr_accessible :body

  validates :body, presence:true
end
