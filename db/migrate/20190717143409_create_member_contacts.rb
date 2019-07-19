class CreateMemberContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :member_contacts do |t|
      t.string :name
      t.string :ip
      t.string :member_id
      t.string :member_code
      t.string :contact_id
      t.string :contact_type
      t.string :company
      t.string :contact_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :phone_ext
      t.string :email
      t.string :group_id
      t.string :stype
      t.string :billing

      t.timestamps
    end
  end
end
