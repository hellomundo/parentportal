class AddTaskTypeToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :task_type_id, :integer
  end
end
