class Group < ApplicationRecord
  belongs_to :user
  has_many :member_contacts
  has_many :member_details
  include PublicActivity::Model

  
end
