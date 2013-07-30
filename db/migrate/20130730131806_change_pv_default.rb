class ChangePvDefault < ActiveRecord::Migration
  def up
    Phrase.update_all ["pv = ?", 0]
  end

  def down
  end
end
