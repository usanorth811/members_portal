require 'rails_helper'

RSpec.describe "destinations/index", type: :view do
  before(:each) do
    assign(:destinations, [
      Destination.create!(
        :old_destination => "Old Destination",
        :new_destination => "New Destination",
        :code => "Code",
        :group => nil,
        :user => nil
      ),
      Destination.create!(
        :old_destination => "Old Destination",
        :new_destination => "New Destination",
        :code => "Code",
        :group => nil,
        :user => nil
      )
    ])
  end

  it "renders a list of destinations" do
    render
    assert_select "tr>td", :text => "Old Destination".to_s, :count => 2
    assert_select "tr>td", :text => "New Destination".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
