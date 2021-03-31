class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.belongs_to :group, null: false, foreign_key: true
      t.belongs_to :delivery, null: false, foreign_key: true
      t.belongs_to :concerned_citizen_ticket, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
