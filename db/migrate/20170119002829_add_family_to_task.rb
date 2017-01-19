class AddFamilyToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :family, foreign_key: true
  end
end
