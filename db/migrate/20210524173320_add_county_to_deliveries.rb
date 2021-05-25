class AddCountyToDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :county, :string
  end
end
