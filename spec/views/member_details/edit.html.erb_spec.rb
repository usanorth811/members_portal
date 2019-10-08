require 'rails_helper'

RSpec.describe "member_details/edit", type: :view do
  before(:each) do
    @member_detail = assign(:member_detail, MemberDetail.create!(
      :name => "MyString",
      :member_id => "MyString",
      :member_code => "MyString",
      :stype => "MyString",
      :group => "MyString",
      :company => "MyString",
      :description => "MyString",
      :facility => "MyString",
      :active => "MyString",
      :group => nil
    ))
  end

  it "renders the edit member_detail form" do
    render

    assert_select "form[action=?][method=?]", member_detail_path(@member_detail), "post" do

      assert_select "input[name=?]", "member_detail[name]"

      assert_select "input[name=?]", "member_detail[member_id]"

      assert_select "input[name=?]", "member_detail[member_code]"

      assert_select "input[name=?]", "member_detail[stype]"

      assert_select "input[name=?]", "member_detail[group]"

      assert_select "input[name=?]", "member_detail[company]"

      assert_select "input[name=?]", "member_detail[description]"

      assert_select "input[name=?]", "member_detail[facility]"

      assert_select "input[name=?]", "member_detail[active]"

      assert_select "input[name=?]", "member_detail[group_id]"
    end
  end
end
