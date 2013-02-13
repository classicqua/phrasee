class AddAccountColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image, :string
    add_column :users, :introduction, :text
    add_column :users, :gender, :integer
    add_column :users, :birth, :date
    add_column :users, :country_id, :integer
    add_column :users, :postal_code, :string
    add_column :users, :mail_flg, :boolean
  end
end
