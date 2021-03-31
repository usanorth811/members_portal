require 'rails_helper'

RSpec.describe "concerned_citizen_tickets/index", type: :view do
  before(:each) do
    assign(:concerned_citizen_tickets, [
      ConcernedCitizenTicket.create!(
        :first => "First",
        :last => "Last",
        :email => "Email",
        :state => "State",
        :city => "City",
        :zip => "Zip",
        :address => "Address",
        :description => "MyText",
        :notify_citizen => false
      ),
      ConcernedCitizenTicket.create!(
        :first => "First",
        :last => "Last",
        :email => "Email",
        :state => "State",
        :city => "City",
        :zip => "Zip",
        :address => "Address",
        :description => "MyText",
        :notify_citizen => false
      )
    ])
  end

  it "renders a list of concerned_citizen_tickets" do
    render
    assert_select "tr>td", :text => "First".to_s, :count => 2
    assert_select "tr>td", :text => "Last".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
