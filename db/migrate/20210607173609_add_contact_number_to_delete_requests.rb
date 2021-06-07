class AddContactNumberToDeleteRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :delete_requests, :contact_number, :string
  end
end
