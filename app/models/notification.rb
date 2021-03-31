class Notification < ApplicationRecord
  belongs_to :group
  belongs_to :delivery
  belongs_to :concerned_citizen_ticket

  after_create :send_notification

  def send_notification
    NotificationMailer.with(ticket: concerned_citizen_ticket_id, delivery: delivery_id).new_ticket.deliver_later
  end
end
