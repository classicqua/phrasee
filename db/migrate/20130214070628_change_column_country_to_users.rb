class ChangeColumnCountryToUsers < ActiveRecord::Migration
  def up
    change_column :users, :country, :string
  end

  def down
  end
end
