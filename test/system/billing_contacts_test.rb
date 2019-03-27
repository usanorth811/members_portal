require "application_system_test_case"

class BillingContactsTest < ApplicationSystemTestCase
  setup do
    @billing_contact = billing_contacts(:one)
  end

  test "visiting the index" do
    visit billing_contacts_url
    assert_selector "h1", text: "Billing Contacts"
  end

  test "creating a Billing contact" do
    visit billing_contacts_url
    click_on "New Billing Contact"

    fill_in "Addr", with: @billing_contact.addr
    fill_in "Company", with: @billing_contact.company_id
    fill_in "Email", with: @billing_contact.email
    fill_in "Name", with: @billing_contact.name
    fill_in "Phone", with: @billing_contact.phone
    click_on "Create Billing contact"

    assert_text "Billing contact was successfully created"
    click_on "Back"
  end

  test "updating a Billing contact" do
    visit billing_contacts_url
    click_on "Edit", match: :first

    fill_in "Addr", with: @billing_contact.addr
    fill_in "Company", with: @billing_contact.company_id
    fill_in "Email", with: @billing_contact.email
    fill_in "Name", with: @billing_contact.name
    fill_in "Phone", with: @billing_contact.phone
    click_on "Update Billing contact"

    assert_text "Billing contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Billing contact" do
    visit billing_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Billing contact was successfully destroyed"
  end
end
