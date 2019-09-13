class MemberContact < ApplicationRecord
    belongs_to :group

    validates :contact_type, :presence => true
    validates :contact_name, :presence => true
    validates :phone, :presence => true, format: { with: /\A[+-]?\d+\z/, message: " must be a number"}, :length =>{ :is => 10}
    validates :zip, format: { with: /\A[+-]?\d+\z/, message: " code must be a number"}, :length =>{ :is => 5},:allow_blank => true
    validates :phone_ext, format: { with: /\A[+-]?\d+\z/, message: " must be a number"},:allow_blank => true
    validates :address1, format: { with: /\A[A-Za-z0-9-\/\.\s]+\z/},:allow_blank => true
    validates :address2, format: { with: /\A[A-Za-z0-9-\/\.\s]+\z/},:allow_blank => true
    validates :city, format: { with: /\A[A-Za-z0-9-\/\.\s]+\z/},:allow_blank => true
    validates :state, format: { with: /\A[A-Za-z0-9-\/\.\s]+\z/},:allow_blank => true
    
    include PublicActivity::Model
	tracked owner: Proc.new { |controller, model| controller.current_user ? controller.current_user : nil }
    tracked billing: Proc.new {|controller, model| controller.billing }
    tracked stype: Proc.new {|controller, model| controller.stype }
    tracked code: Proc.new {|controller, model| controller.code }
    tracked contact_type: Proc.new {|controller, model| controller.contact_type }
    
end


