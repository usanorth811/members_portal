require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :group => nil,
      :delivery => nil,
      :concerned_citizen_ticket => nil,
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
  end
end
