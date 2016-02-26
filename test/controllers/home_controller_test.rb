require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get find_friends" do
    get :find_friends
    assert_response :success
  end

  test "should get front" do
    get :front
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
