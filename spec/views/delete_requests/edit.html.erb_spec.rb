require 'rails_helper'

RSpec.describe "delete_requests/edit", type: :view do
  before(:each) do
    @delete_request = assign(:delete_request, DeleteRequest.create!(
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

  it "renders the edit delete_request form" do
    render

    assert_select "form[action=?][method=?]", delete_request_path(@delete_request), "post" do

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
