require 'rails_helper'

RSpec.describe "delete_requests/index", type: :view do
  before(:each) do
    assign(:delete_requests, [
      DeleteRequest.create!(
        :code => "Code",
        :billing => "Billing",
        :contact_type => "Contact Type",
        :contact_name => "Contact Name",
        :phone => "Phone",
        :email => "Email",
        :user => nil,
        :compleated => false
      ),
      DeleteRequest.create!(
        :code => "Code",
        :billing => "Billing",
        :contact_type => "Contact Type",
        :contact_name => "Contact Name",
        :phone => "Phone",
        :email => "Email",
        :user => nil,
        :compleated => false
      )
    ])
  end

  it "renders a list of delete_requests" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Billing".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Type".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
