class Delivery < ApplicationRecord
  belongs_to :group
  has_many :notifications,  :dependent => :destroy

  validates :ticket_type, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :delivery_type, presence: true
  validates :email, presence: true, if: :email_notification
  validates :phone, numericality: { only_integer: true }, presence: true, if: :sms_notification
  validates :zip, :numericality => {:allow_blank => true}
  validates :group_id, presence: true

  def email_notification
    delivery_type == 'email'
  end

  def sms_notification
    delivery_type == 'sms'
  end

end
