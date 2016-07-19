class FixReferencesInFamily < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :family, index: true

    remove_reference :families, :user, index: true;
  end
end
