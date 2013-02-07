class AddSourceToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :source, :string
  end
end
