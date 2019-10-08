require 'rails_helper'

RSpec.describe "member_details/index", type: :view do
  before(:each) do
    assign(:member_details, [
      MemberDetail.create!(
        :name => "Name",
        :member_id => "Member",
        :member_code => "Member Code",
        :stype => "Stype",
        :group => "Group",
        :company => "Company",
        :description => "Description",
        :facility => "Facility",
        :active => "Active",
        :group => nil
      ),
      MemberDetail.create!(
        :name => "Name",
        :member_id => "Member",
        :member_code => "Member Code",
        :stype => "Stype",
        :group => "Group",
        :company => "Company",
        :description => "Description",
        :facility => "Facility",
        :active => "Active",
        :group => nil
      )
    ])
  end

  it "renders a list of member_details" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Member".to_s, :count => 2
    assert_select "tr>td", :text => "Member Code".to_s, :count => 2
    assert_select "tr>td", :text => "Stype".to_s, :count => 2
    assert_select "tr>td", :text => "Group".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Facility".to_s, :count => 2
    assert_select "tr>td", :text => "Active".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
