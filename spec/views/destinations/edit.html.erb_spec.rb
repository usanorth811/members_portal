require 'rails_helper'

RSpec.describe "destinations/edit", type: :view do
  before(:each) do
    @destination = assign(:destination, Destination.create!(
      :old_destination => "MyString",
      :new_destination => "MyString",
      :code => "MyString",
      :group => nil,
      :user => nil
    ))
  end

  it "renders the edit destination form" do
    render

    assert_select "form[action=?][method=?]", destination_path(@destination), "post" do

      assert_select "input[name=?]", "destination[old_destination]"

      assert_select "input[name=?]", "destination[new_destination]"

      assert_select "input[name=?]", "destination[code]"

      assert_select "input[name=?]", "destination[group_id]"

      assert_select "input[name=?]", "destination[user_id]"
    end
  end
end
