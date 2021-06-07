class AddColumnsToDestinations < ActiveRecord::Migration[6.1]
  def change
    add_column :destinations, :member, :string
    add_column :destinations, :completed, :boolean
  end
end
