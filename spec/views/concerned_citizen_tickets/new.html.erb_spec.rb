require 'rails_helper'

RSpec.describe "concerned_citizen_tickets/new", type: :view do
  before(:each) do
    assign(:concerned_citizen_ticket, ConcernedCitizenTicket.new(
      :first => "MyString",
      :last => "MyString",
      :email => "MyString",
      :state => "MyString",
      :city => "MyString",
      :zip => "MyString",
      :address => "MyString",
      :description => "MyText",
      :notify_citizen => false
    ))
  end

  it "renders new concerned_citizen_ticket form" do
    render

    assert_select "form[action=?][method=?]", concerned_citizen_tickets_path, "post" do

      assert_select "input[name=?]", "concerned_citizen_ticket[first]"

      assert_select "input[name=?]", "concerned_citizen_ticket[last]"

      assert_select "input[name=?]", "concerned_citizen_ticket[email]"

      assert_select "input[name=?]", "concerned_citizen_ticket[state]"

      assert_select "input[name=?]", "concerned_citizen_ticket[city]"

      assert_select "input[name=?]", "concerned_citizen_ticket[zip]"

      assert_select "input[name=?]", "concerned_citizen_ticket[address]"

      assert_select "textarea[name=?]", "concerned_citizen_ticket[description]"

      assert_select "input[name=?]", "concerned_citizen_ticket[notify_citizen]"
    end
  end
end
