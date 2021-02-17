class Codestatus < ApplicationRecord
  belongs_to :user
  belongs_to :group

  after_commit :send_update

  def send_update
    UpdateDetails.new(id).update
  end
end
