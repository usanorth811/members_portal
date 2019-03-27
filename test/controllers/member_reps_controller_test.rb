require 'test_helper'

class MemberRepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member_rep = member_reps(:one)
  end

  test "should get index" do
    get member_reps_url
    assert_response :success
  end

  test "should get new" do
    get new_member_rep_url
    assert_response :success
  end

  test "should create member_rep" do
    assert_difference('MemberRep.count') do
      post member_reps_url, params: { member_rep: { addr: @member_rep.addr, company_id: @member_rep.company_id, email: @member_rep.email, name: @member_rep.name, phone: @member_rep.phone } }
    end

    assert_redirected_to member_rep_url(MemberRep.last)
  end

  test "should show member_rep" do
    get member_rep_url(@member_rep)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_rep_url(@member_rep)
    assert_response :success
  end

  test "should update member_rep" do
    patch member_rep_url(@member_rep), params: { member_rep: { addr: @member_rep.addr, company_id: @member_rep.company_id, email: @member_rep.email, name: @member_rep.name, phone: @member_rep.phone } }
    assert_redirected_to member_rep_url(@member_rep)
  end

  test "should destroy member_rep" do
    assert_difference('MemberRep.count', -1) do
      delete member_rep_url(@member_rep)
    end

    assert_redirected_to member_reps_url
  end
end
