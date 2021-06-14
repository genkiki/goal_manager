class CreateTaskStates < ActiveRecord::Migration[5.2]
  def change
    create_table :task_states do |t|
      t.string :state

      t.timestamps
    end
  end
end
