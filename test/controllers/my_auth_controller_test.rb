require 'test_helper'

class MyAuthControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
