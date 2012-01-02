require 'test_helper'

class WhenCustomFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_custom_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_custom_factor" do
    assert_difference('WhenCustomFactor.count') do
      post :create, :when_custom_factor => { }
    end

    assert_redirected_to when_custom_factor_path(assigns(:when_custom_factor))
  end

  test "should show when_custom_factor" do
    get :show, :id => when_custom_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_custom_factors(:one).to_param
    assert_response :success
  end

  test "should update when_custom_factor" do
    put :update, :id => when_custom_factors(:one).to_param, :when_custom_factor => { }
    assert_redirected_to when_custom_factor_path(assigns(:when_custom_factor))
  end

  test "should destroy when_custom_factor" do
    assert_difference('WhenCustomFactor.count', -1) do
      delete :destroy, :id => when_custom_factors(:one).to_param
    end

    assert_redirected_to when_custom_factors_path
  end
end
