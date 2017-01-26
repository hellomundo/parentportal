class AddPerformedOnToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :performed_on, :date
  end
end
