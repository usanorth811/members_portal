class Code < ApplicationRecord
  belongs_to :company
  has_many :contacts
end
