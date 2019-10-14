class MemberDetail < ApplicationRecord
  belongs_to :group
  validates :facility, :presence => true
end
