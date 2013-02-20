class AddIndexUniqueToFavorites < ActiveRecord::Migration
  def change
    add_index :favorites, [:user_id, :phrase_id], :unique => true
  end
end
