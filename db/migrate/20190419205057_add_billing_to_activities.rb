class AddBillingToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :billing, :string
  end
end
