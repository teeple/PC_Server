require 'test_helper'

class WhoNumberFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_number_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_number_factor" do
    assert_difference('WhoNumberFactor.count') do
      post :create, :who_number_factor => { }
    end

    assert_redirected_to who_number_factor_path(assigns(:who_number_factor))
  end

  test "should show who_number_factor" do
    get :show, :id => who_number_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_number_factors(:one).to_param
    assert_response :success
  end

  test "should update who_number_factor" do
    put :update, :id => who_number_factors(:one).to_param, :who_number_factor => { }
    assert_redirected_to who_number_factor_path(assigns(:who_number_factor))
  end

  test "should destroy who_number_factor" do
    assert_difference('WhoNumberFactor.count', -1) do
      delete :destroy, :id => who_number_factors(:one).to_param
    end

    assert_redirected_to who_number_factors_path
  end
end
