class Contact < ApplicationRecord
	  belongs_to :code
	include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
	tracked billing: Proc.new {|controller, model| controller.billing }


end
