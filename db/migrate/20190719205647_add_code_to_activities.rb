class AddCodeToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :code, :string
  end
end
