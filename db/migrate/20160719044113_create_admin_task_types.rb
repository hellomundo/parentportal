class CreateAdminTaskTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_task_types do |t|

      t.timestamps
    end
  end
end
