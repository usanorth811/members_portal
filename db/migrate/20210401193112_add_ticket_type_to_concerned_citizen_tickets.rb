class AddTicketTypeToConcernedCitizenTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :concerned_citizen_tickets, :ticket_type, :string
  end
end
