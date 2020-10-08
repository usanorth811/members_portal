class Group < ApplicationRecord
  belongs_to :user

  has_many :member_contacts
  has_many :member_details
  has_many :codestatuses, dependent: :destroy
  include PublicActivity::Model

  
end
