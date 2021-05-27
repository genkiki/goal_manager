class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :content
      t.string :result
      t.string :cause
      t.string :improvement

      t.timestamps
    end
  end
end
