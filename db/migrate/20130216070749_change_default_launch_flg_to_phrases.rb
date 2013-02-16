class ChangeDefaultLaunchFlgToPhrases < ActiveRecord::Migration
  def up
    change_column_default :phrases, :launch_flg, true
  end

  def down
  end
end
