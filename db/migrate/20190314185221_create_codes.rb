class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.string :code
      t.string :name
      t.string :facility_type
      t.string :destination
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
