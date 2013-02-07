class Phrase < ActiveRecord::Base
  attr_accessible :japanese, :english, :source, :story, :launch_flg
  belongs_to :user
end
