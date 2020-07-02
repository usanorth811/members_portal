require 'rails_helper'

RSpec.describe "codestatuses/edit", type: :view do
  before(:each) do
    @codestatus = assign(:codestatus, Codestatus.create!(
      :code => "MyString",
      :sar_updated => false,
      :contacts_updated => false,
      :user => nil,
      :group => nil
    ))
  end

  it "renders the edit codestatus form" do
    render

    assert_select "form[action=?][method=?]", codestatus_path(@codestatus), "post" do

      assert_select "input[name=?]", "codestatus[code]"

      assert_select "input[name=?]", "codestatus[sar_updated]"

      assert_select "input[name=?]", "codestatus[contacts_updated]"

      assert_select "input[name=?]", "codestatus[user_id]"

      assert_select "input[name=?]", "codestatus[group_id]"
    end
  end
end
