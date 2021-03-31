require 'rails_helper'

RSpec.describe "deliveries/show", type: :view do
  before(:each) do
    @delivery = assign(:delivery, Delivery.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Billing/)
    expect(rendered).to match(/Member Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Delivery Type/)
    expect(rendered).to match(/Deliver To/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Zip/)
  end
end
