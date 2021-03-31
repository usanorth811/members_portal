class NotificationMailer < ApplicationMailer
  def new_ticket
    @delivery = Delivery.find(params[:delivery])
    @ticket = ConcernedCitizenTicket.find(params[:ticket])
    mail(to: @delivery.email, subject: 'New Concerned Citizen Ticket')
  end
end
