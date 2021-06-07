class CreateDeleteRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :delete_requests do |t|
      t.string :code
      t.string :billing
      t.string :contact_type
      t.string :contact_name
      t.string :phone
      t.string :email
      t.belongs_to :user, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
