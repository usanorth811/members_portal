class AddColumnsToConcernedCitizenTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :concerned_citizen_tickets, :street, :string
    add_column :concerned_citizen_tickets, :cross_st, :string
  end
end
