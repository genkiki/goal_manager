class AddColumnGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :start_date, :datetime
    add_column :goals, :end_date, :datetime
  end
end
