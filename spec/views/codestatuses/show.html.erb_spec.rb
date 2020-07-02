require 'rails_helper'

RSpec.describe "codestatuses/show", type: :view do
  before(:each) do
    @codestatus = assign(:codestatus, Codestatus.create!(
      :code => "Code",
      :sar_updated => false,
      :contacts_updated => false,
      :user => nil,
      :group => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
