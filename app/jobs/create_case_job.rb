class CreateCaseJob < ApplicationJob
  queue_as :default

  def perform(*case_type, instance, user_id)
    @user_id = user_id
    @case_type = case_type
    @data = instance
    get_requirements

    require 'restforce'
    client = Restforce.new(host: 'test.salesforce.com',
            username: ENV['SALESFORCE_USERNAME'],
            password: ENV['SALESFORCE_PASSWORD'],
            client_id: ENV['SALESFORCE_CLIENT_ID'],
            client_secret: ENV['SALESFORCE_CLIENT_SECRET'],
                           api_version: '52.0')
    client.authenticate!
    client.describe
    resp = client.create('Case', @post_data)
  end

  def get_requirements
    @user = User.find(@user_id)
    @group = Group.find(@data.group_id)
    new_rep = @data.contact_name.split(' ', 2)
    @post_data = {SuppliedName: "#{@user.profile.first_name} #{@user.profile.last_name}",
                  SuppliedEmail: @user.email,
                  SuppliedPhone: @user.profile.phone,
                  SuppliedCompany: @group.name,
                  New_Member_Rep_First_Name__c: new_rep[0],
                  New_Member_Rep_Last_Name__c: new_rep[1],
                  New_Member_Rep_Email__c: @data.email,
                  New_Member_Rep_Phone__c: @data.phone,
                  Origin: 'Web',
                  Type: "#{@case_type[0]}",
                  Subject: "#{@case_type[0]}",
                  Description: ""}
  end

end
