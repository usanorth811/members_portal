class AddTicketTypeToDeliveries < ActiveRecord::Migration[6.1]
  def change
    add_column :deliveries, :ticket_type, :string
  end
end
