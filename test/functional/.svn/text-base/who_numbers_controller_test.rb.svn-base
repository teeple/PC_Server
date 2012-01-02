require 'test_helper'

class WhoNumbersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_number" do
    assert_difference('WhoNumber.count') do
      post :create, :who_number => { }
    end

    assert_redirected_to who_number_path(assigns(:who_number))
  end

  test "should show who_number" do
    get :show, :id => who_numbers(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_numbers(:one).to_param
    assert_response :success
  end

  test "should update who_number" do
    put :update, :id => who_numbers(:one).to_param, :who_number => { }
    assert_redirected_to who_number_path(assigns(:who_number))
  end

  test "should destroy who_number" do
    assert_difference('WhoNumber.count', -1) do
      delete :destroy, :id => who_numbers(:one).to_param
    end

    assert_redirected_to who_numbers_path
  end
end
