class AddLaunchFlgToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :launch_flg, :boolean
  end
end
