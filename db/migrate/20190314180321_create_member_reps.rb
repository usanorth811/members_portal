class CreateMemberReps < ActiveRecord::Migration[5.2]
  def change
    create_table :member_reps do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :addr
      t.belongs_to :company, foreign_key: true

      t.timestamps
    end
  end
end
