class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :billing
      t.string :member_code
      t.belongs_to :group, null: false, foreign_key: true
      t.string :delivery_type
      t.string :deliver_to
      t.string :email
      t.string :phone
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
