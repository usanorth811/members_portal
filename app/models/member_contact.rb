class MemberContact < ApplicationRecord
    belongs_to :group
    
    include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
    tracked billing: Proc.new {|controller, model| controller.billing }
    tracked stype: Proc.new {|controller, model| controller.stype }
    tracked code: Proc.new {|controller, model| controller.code }
end
