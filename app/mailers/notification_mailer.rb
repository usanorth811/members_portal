class NotificationMailer < ApplicationMailer
  def new_ticket
    @delivery = Delivery.find(params[:delivery])
    @ticket = Ticket.find(params[:ticket])
    mail(from: 'memberservices@usanorth811.org', to: @delivery.email, subject: 'New Concerned Citizen Ticket')
  end
end
