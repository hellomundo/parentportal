class AddIsActiveToFamilies < ActiveRecord::Migration[5.0]
  def change
    add_column :families, :is_active, :boolean, default: true
  end
end
