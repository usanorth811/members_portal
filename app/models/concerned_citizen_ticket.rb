class ConcernedCitizenTicket < ApplicationRecord

  after_create :start_deliver

  def start_deliver
    DeliverTicket.new(id).deliver
  end
end
