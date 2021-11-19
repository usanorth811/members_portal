class NotificationMailer < ApplicationMailer
  def new_ticket
    @delivery = Delivery.find(params[:delivery])
    @ticket = ConcernedCitizenTicket.find(params[:ticket])
    mail(from: 'memberservices@em6567.usanorth811.org', to: @delivery.email,
         subject: "New #{@ticket.ticket_type == 'cross_bore' ? 'Cross Bore' : 'Concerned Citizen'} Ticket")
  end
end
