#coding: utf-8

class Goiken < ActiveRecord::Base
  attr_accessible :body

  validates :body, presence:true
end
