class AddContactTypeToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :contact_type, :string
  end
end
