require 'rails_helper'

RSpec.describe "delete_requests/new", type: :view do
  before(:each) do
    assign(:delete_request, DeleteRequest.new(
      :code => "MyString",
      :billing => "MyString",
      :contact_type => "MyString",
      :contact_name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :user => nil,
      :compleated => false
    ))
  end

  it "renders new delete_request form" do
    render

    assert_select "form[action=?][method=?]", delete_requests_path, "post" do

      assert_select "input[name=?]", "delete_request[code]"

      assert_select "input[name=?]", "delete_request[billing]"

      assert_select "input[name=?]", "delete_request[contact_type]"

      assert_select "input[name=?]", "delete_request[contact_name]"

      assert_select "input[name=?]", "delete_request[phone]"

      assert_select "input[name=?]", "delete_request[email]"

      assert_select "input[name=?]", "delete_request[user_id]"

      assert_select "input[name=?]", "delete_request[compleated]"
    end
  end
end
