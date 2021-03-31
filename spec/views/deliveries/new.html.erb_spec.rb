require 'rails_helper'

RSpec.describe "deliveries/new", type: :view do
  before(:each) do
    assign(:delivery, Delivery.new(
      :billing => "MyString",
      :member_code => "MyString",
      :group => nil,
      :delivery_type => "MyString",
      :deliver_to => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString"
    ))
  end

  it "renders new delivery form" do
    render

    assert_select "form[action=?][method=?]", deliveries_path, "post" do

      assert_select "input[name=?]", "delivery[billing]"

      assert_select "input[name=?]", "delivery[member_code]"

      assert_select "input[name=?]", "delivery[group_id]"

      assert_select "input[name=?]", "delivery[delivery_type]"

      assert_select "input[name=?]", "delivery[deliver_to]"

      assert_select "input[name=?]", "delivery[email]"

      assert_select "input[name=?]", "delivery[phone]"

      assert_select "input[name=?]", "delivery[city]"

      assert_select "input[name=?]", "delivery[state]"

      assert_select "input[name=?]", "delivery[zip]"
    end
  end
end
