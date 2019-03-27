class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :name
      t.string :phone
      t.string :email
      t.belongs_to :code, foreign_key: true

      t.timestamps
    end
  end
end
