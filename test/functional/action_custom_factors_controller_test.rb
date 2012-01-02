require 'test_helper'

class ActionCustomFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_custom_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_custom_factor" do
    assert_difference('ActionCustomFactor.count') do
      post :create, :action_custom_factor => { }
    end

    assert_redirected_to action_custom_factor_path(assigns(:action_custom_factor))
  end

  test "should show action_custom_factor" do
    get :show, :id => action_custom_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_custom_factors(:one).to_param
    assert_response :success
  end

  test "should update action_custom_factor" do
    put :update, :id => action_custom_factors(:one).to_param, :action_custom_factor => { }
    assert_redirected_to action_custom_factor_path(assigns(:action_custom_factor))
  end

  test "should destroy action_custom_factor" do
    assert_difference('ActionCustomFactor.count', -1) do
      delete :destroy, :id => action_custom_factors(:one).to_param
    end

    assert_redirected_to action_custom_factors_path
  end
end
