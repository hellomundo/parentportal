class AddFamilyMembershipToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :families, :user, index: true
  end
end
