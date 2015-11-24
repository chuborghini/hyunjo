require 'test_helper'

class TwitControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get list_byuser" do
    get :list_byuser
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit_view" do
    get :edit_view
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
