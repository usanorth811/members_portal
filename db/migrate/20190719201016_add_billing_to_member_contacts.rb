class AddBillingToMemberContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :member_contacts, :billing, :string
  end
end
