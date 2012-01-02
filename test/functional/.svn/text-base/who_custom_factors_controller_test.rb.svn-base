require 'test_helper'

class WhoCustomFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_custom_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_custom_factor" do
    assert_difference('WhoCustomFactor.count') do
      post :create, :who_custom_factor => { }
    end

    assert_redirected_to who_custom_factor_path(assigns(:who_custom_factor))
  end

  test "should show who_custom_factor" do
    get :show, :id => who_custom_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_custom_factors(:one).to_param
    assert_response :success
  end

  test "should update who_custom_factor" do
    put :update, :id => who_custom_factors(:one).to_param, :who_custom_factor => { }
    assert_redirected_to who_custom_factor_path(assigns(:who_custom_factor))
  end

  test "should destroy who_custom_factor" do
    assert_difference('WhoCustomFactor.count', -1) do
      delete :destroy, :id => who_custom_factors(:one).to_param
    end

    assert_redirected_to who_custom_factors_path
  end
end
