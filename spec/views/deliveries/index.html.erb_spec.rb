require 'rails_helper'

RSpec.describe "deliveries/index", type: :view do
  before(:each) do
    assign(:deliveries, [
      Delivery.create!(
        :billing => "Billing",
        :member_code => "Member Code",
        :group => nil,
        :delivery_type => "Delivery Type",
        :deliver_to => "Deliver To",
        :email => "Email",
        :phone => "Phone",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      ),
      Delivery.create!(
        :billing => "Billing",
        :member_code => "Member Code",
        :group => nil,
        :delivery_type => "Delivery Type",
        :deliver_to => "Deliver To",
        :email => "Email",
        :phone => "Phone",
        :city => "City",
        :state => "State",
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of deliveries" do
    render
    assert_select "tr>td", :text => "Billing".to_s, :count => 2
    assert_select "tr>td", :text => "Member Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Delivery Type".to_s, :count => 2
    assert_select "tr>td", :text => "Deliver To".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
