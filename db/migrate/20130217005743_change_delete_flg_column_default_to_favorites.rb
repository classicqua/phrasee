class ChangeDeleteFlgColumnDefaultToFavorites < ActiveRecord::Migration
  def up
    change_column_default :favorites, :delete_flg, false
  end

  def down
  end
end
