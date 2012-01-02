require 'test_helper'

class TimeTestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_test" do
    assert_difference('TimeTest.count') do
      post :create, :time_test => { }
    end

    assert_redirected_to time_test_path(assigns(:time_test))
  end

  test "should show time_test" do
    get :show, :id => time_tests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => time_tests(:one).to_param
    assert_response :success
  end

  test "should update time_test" do
    put :update, :id => time_tests(:one).to_param, :time_test => { }
    assert_redirected_to time_test_path(assigns(:time_test))
  end

  test "should destroy time_test" do
    assert_difference('TimeTest.count', -1) do
      delete :destroy, :id => time_tests(:one).to_param
    end

    assert_redirected_to time_tests_path
  end
end
