require 'test_helper'

class SshActionsControllerTest < ActionController::TestCase
  test "should get testConnection" do
    get :testConnection
    assert_response :success
  end

  test "should get runCommand" do
    get :runCommand
    assert_response :success
  end

  test "should get getInfo" do
    get :getInfo
    assert_response :success
  end

end
