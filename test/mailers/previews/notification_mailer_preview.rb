class NotificationMailerPreview < ActionMailer::Preview
  def new_ticket
    @delivery = Delivery.first
    @ticket = ConcernedCitizenTicket.first
    NotificationMailer.with(ticket: @ticket.id, delivery: @delivery.id).new_ticket
  end
end