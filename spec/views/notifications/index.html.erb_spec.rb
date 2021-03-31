require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :group => nil,
        :delivery => nil,
        :concerned_citizen_ticket => nil,
        :description => "Description"
      ),
      Notification.create!(
        :group => nil,
        :delivery => nil,
        :concerned_citizen_ticket => nil,
        :description => "Description"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
