class AddStoryToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :story, :text
  end
end
