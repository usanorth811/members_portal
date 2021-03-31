require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :group => nil,
      :delivery => nil,
      :concerned_citizen_ticket => nil,
      :description => "MyString"
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input[name=?]", "notification[group_id]"

      assert_select "input[name=?]", "notification[delivery_id]"

      assert_select "input[name=?]", "notification[concerned_citizen_ticket_id]"

      assert_select "input[name=?]", "notification[description]"
    end
  end
end
