class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.string :name
      t.integer :connection
      
      t.references :student, index: true;
      t.references :user, index: true;

      t.timestamps
    end
  end
end
