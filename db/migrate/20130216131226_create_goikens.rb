class CreateGoikens < ActiveRecord::Migration
  def change
    create_table :goikens do |t|
      t.text :body

      t.timestamps
    end
  end
end
