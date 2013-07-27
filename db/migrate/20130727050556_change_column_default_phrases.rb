class ChangeColumnDefaultPhrases < ActiveRecord::Migration
  def up
    change_column_default :phrases, :pv, 0
  end

  def down
  end
end
