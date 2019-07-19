class MemberContact < ApplicationRecord
    belongs_to :group
    
    include PublicActivity::Model
	#tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
	#tracked billing: Proc.new {|controller, model| self.group(:billing_id) }
end
