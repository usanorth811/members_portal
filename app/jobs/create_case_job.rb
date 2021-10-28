class CreateCaseJob < ApplicationJob
  queue_as :default

  def perform(*destination)

    @destination = destination[0]

    get_requirements

    require 'restforce'
    client = Restforce.new(host: 'test.salesforce.com',
            username: 'caleb.woods@usanorth811.org.sandbox',
            password: 'Mu$k3t33r$Mu$k3t33r$',
                           #security_token: '6Cel800D7g000000H2um8887g000000fxWmHHUd8F1WD7IA5YYus507w9jNWl8hkkil1YucxdxFtnPZDqWSMSVVpTdLLNJ8cNi6pgsAtUvw',
            client_id: '3MVG9jfQT7vUue.F1LIMNmoTmeDlbL7A36kY88un_6wqIEV3jRQYxbd6mQ7INyKAME7tY5ylla0yF64tCj8dT',
            client_secret: '49F0E1485BEA4A0116D1F574A979284C80D156E1CF978873AEAFA2FB9A892886',
                           api_version: '52.0')
    client.authenticate!
    client.describe
    resp = client.create('Case',
                         SuppliedName: "#{@user.profile.first_name} #{@user.profile.last_name}",
                         SuppliedEmail: @user.email,
                         SuppliedPhone: @user.profile.phone,
                         SuppliedCompany: @destination.code,
                         Type: "Destination Change",
                         Subject: "Ticket Destination Change",
                         Description: "OLD DESTINATION: #{@destination.old_destination}
NEW DESTINATION: #{@destination.new_destination}")
  end

  def get_requirements
    @user = User.find(@destination.user_id)
  end
end
