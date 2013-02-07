class AddKeyToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :user_id, :integer
    add_column :phrases, :category_id, :integer
  end
end
