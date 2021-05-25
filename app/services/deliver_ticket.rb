class DeliverTicket

  def initialize(id)
    @ticket = ConcernedCitizenTicket.find(id)
  end

  def deliver
    @deliveries = Delivery.all.where(ticket_type: @ticket.ticket_type).where(city: [@ticket.city, '', nil]).where(county: [@ticket.county, '', nil]).where(state: @ticket.state)
    pp @deliveries
    @deliveries.each do |deliver|
      Notification.create(group_id: deliver.group_id, delivery_id: deliver.id, concerned_citizen_ticket_id: @ticket.id, description: "New #{@ticket.ticket_type} Notification Recieved on #{@ticket.created_at}")
    end
  end

end