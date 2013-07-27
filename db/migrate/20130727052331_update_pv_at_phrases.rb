class UpdatePvAtPhrases < ActiveRecord::Migration
  def up
    # pvの初期値を0に
    Phrase.update_all ["pv = ?",0]
  end

  def down
  end
end
