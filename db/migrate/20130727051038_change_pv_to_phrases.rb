class ChangePvToPhrases < ActiveRecord::Migration
  def up
    change_column :phrases, :pv, :integer, :default => 0
  end

  def down
  end
end
