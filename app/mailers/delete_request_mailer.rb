class DeleteRequestMailer < ApplicationMailer
  default from: 'memberportal@usanorth811.org'

  def delete_request
    mail(to: "memberservices@usanorth811.org", subject: 'Contact Delete Request', layout: 'delete_request_mailer')
  end

end
