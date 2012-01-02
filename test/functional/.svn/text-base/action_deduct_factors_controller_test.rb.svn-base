require 'test_helper'

class ActionDeductFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_deduct_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_deduct_factor" do
    assert_difference('ActionDeductFactor.count') do
      post :create, :action_deduct_factor => { }
    end

    assert_redirected_to action_deduct_factor_path(assigns(:action_deduct_factor))
  end

  test "should show action_deduct_factor" do
    get :show, :id => action_deduct_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_deduct_factors(:one).to_param
    assert_response :success
  end

  test "should update action_deduct_factor" do
    put :update, :id => action_deduct_factors(:one).to_param, :action_deduct_factor => { }
    assert_redirected_to action_deduct_factor_path(assigns(:action_deduct_factor))
  end

  test "should destroy action_deduct_factor" do
    assert_difference('ActionDeductFactor.count', -1) do
      delete :destroy, :id => action_deduct_factors(:one).to_param
    end

    assert_redirected_to action_deduct_factors_path
  end
end
