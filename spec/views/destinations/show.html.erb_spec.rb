require 'rails_helper'

RSpec.describe "destinations/show", type: :view do
  before(:each) do
    @destination = assign(:destination, Destination.create!(
      :old_destination => "Old Destination",
      :new_destination => "New Destination",
      :code => "Code",
      :group => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Old Destination/)
    expect(rendered).to match(/New Destination/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
