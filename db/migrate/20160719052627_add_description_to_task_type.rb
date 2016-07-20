class AddDescriptionToTaskType < ActiveRecord::Migration[5.0]
  def change
    add_column :task_types, :description, :text
  end
end
