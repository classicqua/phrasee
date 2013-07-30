class AddColumnPvToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :pv, :integer
  end
end
