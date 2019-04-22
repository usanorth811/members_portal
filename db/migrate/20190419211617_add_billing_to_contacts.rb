class AddBillingToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :billing, :string
  end
end
