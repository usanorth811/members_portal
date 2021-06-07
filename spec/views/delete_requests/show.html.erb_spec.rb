require 'rails_helper'

RSpec.describe "delete_requests/show", type: :view do
  before(:each) do
    @delete_request = assign(:delete_request, DeleteRequest.create!(
      :code => "Code",
      :billing => "Billing",
      :contact_type => "Contact Type",
      :contact_name => "Contact Name",
      :phone => "Phone",
      :email => "Email",
      :user => nil,
      :compleated => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Billing/)
    expect(rendered).to match(/Contact Type/)
    expect(rendered).to match(/Contact Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
  end
end
