#coding: utf-8
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

class Favorite < ActiveRecord::Base
  attr_accessible :delete_flg, :user_id, :phrase_id
  belongs_to :user
  belongs_to :phrase

  validates :user_id, presence:true,
            :uniqueness => { :scope => :phrase_id, :message => "お気に入りに追加できませんでした。" }
  validates :phrase_id, presence:true
end
