class Code < ApplicationRecord
  belongs_to :company
  has_many :contacts
  include PublicActivity::Model
end
