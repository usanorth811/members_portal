class ContactMailer < ApplicationMailer
	def member_contact
		@member_contact = member_contact
	end
	layout:'contact_mailer'
end
