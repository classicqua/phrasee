class AddPhraseToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :japanese, :string
    add_column :phrases, :english, :string
  end
end
