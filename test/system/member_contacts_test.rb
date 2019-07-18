require "application_system_test_case"

class MemberContactsTest < ApplicationSystemTestCase
  setup do
    @member_contact = member_contacts(:one)
  end

  test "visiting the index" do
    visit member_contacts_url
    assert_selector "h1", text: "Member Contacts"
  end

  test "creating a Member contact" do
    visit member_contacts_url
    click_on "New Member Contact"

    fill_in "Address1", with: @member_contact.address1
    fill_in "Address2", with: @member_contact.address2
    fill_in "City", with: @member_contact.city
    fill_in "Company", with: @member_contact.company
    fill_in "Contact", with: @member_contact.contact_id
    fill_in "Contact name", with: @member_contact.contact_name
    fill_in "Email", with: @member_contact.email
    fill_in "Ip", with: @member_contact.ip
    fill_in "Member code", with: @member_contact.member_code
    fill_in "Member", with: @member_contact.member_id
    fill_in "Name", with: @member_contact.name
    fill_in "Phone", with: @member_contact.phone
    fill_in "Phone ext", with: @member_contact.phone_ext
    fill_in "State", with: @member_contact.state
    fill_in "Type", with: @member_contact.type
    fill_in "Zip", with: @member_contact.zip
    click_on "Create Member contact"

    assert_text "Member contact was successfully created"
    click_on "Back"
  end

  test "updating a Member contact" do
    visit member_contacts_url
    click_on "Edit", match: :first

    fill_in "Address1", with: @member_contact.address1
    fill_in "Address2", with: @member_contact.address2
    fill_in "City", with: @member_contact.city
    fill_in "Company", with: @member_contact.company
    fill_in "Contact", with: @member_contact.contact_id
    fill_in "Contact name", with: @member_contact.contact_name
    fill_in "Email", with: @member_contact.email
    fill_in "Ip", with: @member_contact.ip
    fill_in "Member code", with: @member_contact.member_code
    fill_in "Member", with: @member_contact.member_id
    fill_in "Name", with: @member_contact.name
    fill_in "Phone", with: @member_contact.phone
    fill_in "Phone ext", with: @member_contact.phone_ext
    fill_in "State", with: @member_contact.state
    fill_in "Type", with: @member_contact.type
    fill_in "Zip", with: @member_contact.zip
    click_on "Update Member contact"

    assert_text "Member contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Member contact" do
    visit member_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member contact was successfully destroyed"
  end
end
