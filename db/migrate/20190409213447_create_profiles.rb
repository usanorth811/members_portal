class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :employer
      t.string :title
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
