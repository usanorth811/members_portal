class Company < ApplicationRecord
	has_many :groups
	has_many :users, :through => :group
	has_one :billing_contact
	has_one :member_rep
	has_many :codes
end
