class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :goal_id
      t.integer :user_id
      t.string :content
      t.text :action
      t.string :term
      t.text :status

      t.timestamps
    end
  end
end
