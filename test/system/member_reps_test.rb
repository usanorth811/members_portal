require "application_system_test_case"

class MemberRepsTest < ApplicationSystemTestCase
  setup do
    @member_rep = member_reps(:one)
  end

  test "visiting the index" do
    visit member_reps_url
    assert_selector "h1", text: "Member Reps"
  end

  test "creating a Member rep" do
    visit member_reps_url
    click_on "New Member Rep"

    fill_in "Addr", with: @member_rep.addr
    fill_in "Company", with: @member_rep.company_id
    fill_in "Email", with: @member_rep.email
    fill_in "Name", with: @member_rep.name
    fill_in "Phone", with: @member_rep.phone
    click_on "Create Member rep"

    assert_text "Member rep was successfully created"
    click_on "Back"
  end

  test "updating a Member rep" do
    visit member_reps_url
    click_on "Edit", match: :first

    fill_in "Addr", with: @member_rep.addr
    fill_in "Company", with: @member_rep.company_id
    fill_in "Email", with: @member_rep.email
    fill_in "Name", with: @member_rep.name
    fill_in "Phone", with: @member_rep.phone
    click_on "Update Member rep"

    assert_text "Member rep was successfully updated"
    click_on "Back"
  end

  test "destroying a Member rep" do
    visit member_reps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member rep was successfully destroyed"
  end
end
