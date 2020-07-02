require 'rails_helper'

RSpec.describe "codestatuses/index", type: :view do
  before(:each) do
    assign(:codestatuses, [
      Codestatus.create!(
        :code => "Code",
        :sar_updated => false,
        :contacts_updated => false,
        :user => nil,
        :group => nil
      ),
      Codestatus.create!(
        :code => "Code",
        :sar_updated => false,
        :contacts_updated => false,
        :user => nil,
        :group => nil
      )
    ])
  end

  it "renders a list of codestatuses" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
