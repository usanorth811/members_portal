class AddStypeToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :stype, :string
  end
end
