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

require 'spec_helper'

describe Favorite do
  pending "add some examples to (or delete) #{__FILE__}"
end
