class AddCountyToConcernedCitizenTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :concerned_citizen_tickets, :county, :string
  end
end
