class AddDetailToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :detail, :text
  end
end
