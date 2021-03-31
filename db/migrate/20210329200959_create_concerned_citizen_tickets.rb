class CreateConcernedCitizenTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :concerned_citizen_tickets do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :state
      t.string :city
      t.string :zip
      t.string :address
      t.text :description
      t.boolean :notify_citizen

      t.timestamps
    end
  end
end
