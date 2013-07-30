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
#  source      :string(500)
#  story       :text
#  launch_flg  :boolean          default(TRUE)
#  pv          :integer          default(0)
#

require 'spec_helper'

describe Phrase do
  pending "add some examples to (or delete) #{__FILE__}"
end
