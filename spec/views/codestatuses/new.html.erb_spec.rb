require 'rails_helper'

RSpec.describe "codestatuses/new", type: :view do
  before(:each) do
    assign(:codestatus, Codestatus.new(
      :code => "MyString",
      :sar_updated => false,
      :contacts_updated => false,
      :user => nil,
      :group => nil
    ))
  end

  it "renders new codestatus form" do
    render

    assert_select "form[action=?][method=?]", codestatuses_path, "post" do

      assert_select "input[name=?]", "codestatus[code]"

      assert_select "input[name=?]", "codestatus[sar_updated]"

      assert_select "input[name=?]", "codestatus[contacts_updated]"

      assert_select "input[name=?]", "codestatus[user_id]"

      assert_select "input[name=?]", "codestatus[group_id]"
    end
  end
end
