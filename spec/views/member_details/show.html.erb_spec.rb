require 'rails_helper'

RSpec.describe "member_details/show", type: :view do
  before(:each) do
    @member_detail = assign(:member_detail, MemberDetail.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Member/)
    expect(rendered).to match(/Member Code/)
    expect(rendered).to match(/Stype/)
    expect(rendered).to match(/Group/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Facility/)
    expect(rendered).to match(/Active/)
    expect(rendered).to match(//)
  end
end
