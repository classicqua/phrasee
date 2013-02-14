class RenameCountryIdToUsers < ActiveRecord::Migration
  def up
    rename_column :users, :country_id, :country
  end

  def down
  end
end
