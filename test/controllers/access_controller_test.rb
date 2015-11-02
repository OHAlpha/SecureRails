require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get after_register" do
    get :after_register
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get after_login" do
    get :after_login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get after_logout" do
    get :after_logout
    assert_response :success
  end

  test "should get cancel" do
    get :cancel
    assert_response :success
  end

  test "should get after_cancel" do
    get :after_cancel
    assert_response :success
  end

  test "should get check_username" do
    get :check_username
    assert_response :success
  end

  test "should get check_email" do
    get :check_email
    assert_response :success
  end

  test "should get check_passhash" do
    get :check_passhash
    assert_response :success
  end

end
