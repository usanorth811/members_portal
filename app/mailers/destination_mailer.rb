class DestinationMailer < ApplicationMailer
  default from: 'memberportal@usanorth811.org'

  def destination

    mail(to: "caleb.woods@usanorth811.org", subject: 'Destination Change Request', layout: 'destination_mailer')
  end

end
