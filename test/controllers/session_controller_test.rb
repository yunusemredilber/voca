require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get session_create_url
    assert_response :success
  end

  test "should get destroy" do
    get session_destroy_url
    assert_response :success
  end

  test "should get user" do
    get session_user_url
    assert_response :success
  end

  test "should get admin" do
    get session_admin_url
    assert_response :success
  end

  test "should get partner" do
    get session_partner_url
    assert_response :success
  end

end
