class MemberContact < ApplicationRecord
    belongs_to :group

    validates :contact_type, :presence => true
    validates :phone, :presence => true, format: { with: /\A[+-]?\d+\z/, message: " must be a number"}, :length =>{ :is => 10}
    validates :zip, format: { with: /\A[+-]?\d+\z/, message: " code must be a number"}, :length =>{ :is => 5},:allow_blank => true
    validates :phone_ext, format: { with: /\A[+-]?\d+\z/, message: " must be a number"},:allow_blank => true
    
    include PublicActivity::Model
	  tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
    tracked billing: Proc.new {|controller, model| controller.billing }
    tracked stype: Proc.new {|controller, model| controller.stype }
    tracked code: Proc.new {|controller, model| controller.code }
    tracked contact_type: Proc.new {|controller, model| controller.contact_type }

    after_create_commit { broadcast_prepend_to "member_contacts#{billing}", locals: { billing_id: billing}, target: "member_contacts#{billing}" }

end
