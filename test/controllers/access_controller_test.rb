require 'test_helper'

class AccessControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get enter" do
    get :enter
    assert_response :success
  end

  test "should get authorize" do
    get :authorize
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get exit" do
    get :exit
    assert_response :success
  end

end
