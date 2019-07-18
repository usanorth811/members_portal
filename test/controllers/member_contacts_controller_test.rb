require 'test_helper'

class MemberContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_contact = member_contacts(:one)
  end

  test "should get index" do
    get member_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_member_contact_url
    assert_response :success
  end

  test "should create member_contact" do
    assert_difference('MemberContact.count') do
      post member_contacts_url, params: { member_contact: { address1: @member_contact.address1, address2: @member_contact.address2, city: @member_contact.city, company: @member_contact.company, contact_id: @member_contact.contact_id, contact_name: @member_contact.contact_name, email: @member_contact.email, ip: @member_contact.ip, member_code: @member_contact.member_code, member_id: @member_contact.member_id, name: @member_contact.name, phone: @member_contact.phone, phone_ext: @member_contact.phone_ext, state: @member_contact.state, type: @member_contact.type, zip: @member_contact.zip } }
    end

    assert_redirected_to member_contact_url(MemberContact.last)
  end

  test "should show member_contact" do
    get member_contact_url(@member_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_contact_url(@member_contact)
    assert_response :success
  end

  test "should update member_contact" do
    patch member_contact_url(@member_contact), params: { member_contact: { address1: @member_contact.address1, address2: @member_contact.address2, city: @member_contact.city, company: @member_contact.company, contact_id: @member_contact.contact_id, contact_name: @member_contact.contact_name, email: @member_contact.email, ip: @member_contact.ip, member_code: @member_contact.member_code, member_id: @member_contact.member_id, name: @member_contact.name, phone: @member_contact.phone, phone_ext: @member_contact.phone_ext, state: @member_contact.state, type: @member_contact.type, zip: @member_contact.zip } }
    assert_redirected_to member_contact_url(@member_contact)
  end

  test "should destroy member_contact" do
    assert_difference('MemberContact.count', -1) do
      delete member_contact_url(@member_contact)
    end

    assert_redirected_to member_contacts_url
  end
end
