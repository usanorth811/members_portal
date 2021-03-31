require 'rails_helper'

RSpec.describe "concerned_citizen_tickets/show", type: :view do
  before(:each) do
    @concerned_citizen_ticket = assign(:concerned_citizen_ticket, ConcernedCitizenTicket.create!(
      :first => "First",
      :last => "Last",
      :email => "Email",
      :state => "State",
      :city => "City",
      :zip => "Zip",
      :address => "Address",
      :description => "MyText",
      :notify_citizen => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First/)
    expect(rendered).to match(/Last/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Zip/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
