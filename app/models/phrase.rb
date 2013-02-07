class Phrase < ActiveRecord::Base
  attr_accessible :japanese, :english, :source, :story, :launch_flg, :category_id
  belongs_to :user
  belongs_to :category
end
