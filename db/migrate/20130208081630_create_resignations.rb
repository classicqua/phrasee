class CreateResignations < ActiveRecord::Migration
  def change
    create_table :resignations do |t|
      t.text :reason

      t.timestamps
    end
  end
end
