require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :group => nil,
      :delivery => nil,
      :concerned_citizen_ticket => nil,
      :description => "MyString"
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input[name=?]", "notification[group_id]"

      assert_select "input[name=?]", "notification[delivery_id]"

      assert_select "input[name=?]", "notification[concerned_citizen_ticket_id]"

      assert_select "input[name=?]", "notification[description]"
    end
  end
end
