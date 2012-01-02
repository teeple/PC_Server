require 'test_helper'

class TestTestsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:test_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create test_test" do
    assert_difference('TestTest.count') do
      post :create, :test_test => { }
    end

    assert_redirected_to test_test_path(assigns(:test_test))
  end

  test "should show test_test" do
    get :show, :id => test_tests(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => test_tests(:one).to_param
    assert_response :success
  end

  test "should update test_test" do
    put :update, :id => test_tests(:one).to_param, :test_test => { }
    assert_redirected_to test_test_path(assigns(:test_test))
  end

  test "should destroy test_test" do
    assert_difference('TestTest.count', -1) do
      delete :destroy, :id => test_tests(:one).to_param
    end

    assert_redirected_to test_tests_path
  end
end
