require 'test_helper'

class BillingContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing_contact = billing_contacts(:one)
  end

  test "should get index" do
    get billing_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_contact_url
    assert_response :success
  end

  test "should create billing_contact" do
    assert_difference('BillingContact.count') do
      post billing_contacts_url, params: { billing_contact: { addr: @billing_contact.addr, company_id: @billing_contact.company_id, email: @billing_contact.email, name: @billing_contact.name, phone: @billing_contact.phone } }
    end

    assert_redirected_to billing_contact_url(BillingContact.last)
  end

  test "should show billing_contact" do
    get billing_contact_url(@billing_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_contact_url(@billing_contact)
    assert_response :success
  end

  test "should update billing_contact" do
    patch billing_contact_url(@billing_contact), params: { billing_contact: { addr: @billing_contact.addr, company_id: @billing_contact.company_id, email: @billing_contact.email, name: @billing_contact.name, phone: @billing_contact.phone } }
    assert_redirected_to billing_contact_url(@billing_contact)
  end

  test "should destroy billing_contact" do
    assert_difference('BillingContact.count', -1) do
      delete billing_contact_url(@billing_contact)
    end

    assert_redirected_to billing_contacts_url
  end
end
