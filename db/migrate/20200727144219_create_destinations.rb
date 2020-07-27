class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :old_destination
      t.string :new_destination
      t.string :code
      t.belongs_to :group, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
