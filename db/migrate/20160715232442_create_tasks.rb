class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.decimal :hours
      t.text :notes

      t.timestamps
    end
  end
end
