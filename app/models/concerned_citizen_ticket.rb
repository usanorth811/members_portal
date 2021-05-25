class ConcernedCitizenTicket < ApplicationRecord

  after_create :start_deliver

  validates :first, presence: true
  validates :last, presence: true
  validates :email, presence: true
  validates :state, presence: true
  validates :county, presence: true
  validates :city, presence: true
  validates :zip, :numericality => {:allow_blank => true}
  validates :ticket_type, presence: true
  validates :street, presence: true, if: :is_address

  def is_address
    address.present?
  end

  def start_deliver
    DeliverTicket.new(id).deliver
  end
end
