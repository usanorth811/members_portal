class CreateMemberDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :member_details do |t|
      t.string :name
      t.string :member_id
      t.string :member_code
      t.string :stype
      t.string :group
      t.string :company
      t.string :description
      t.string :facility
      t.string :active
      t.belongs_to :group, foreign_key: true

      t.timestamps
    end
  end
end
