require 'test_helper'

class WhereCustomFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_custom_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_custom_factor" do
    assert_difference('WhereCustomFactor.count') do
      post :create, :where_custom_factor => { }
    end

    assert_redirected_to where_custom_factor_path(assigns(:where_custom_factor))
  end

  test "should show where_custom_factor" do
    get :show, :id => where_custom_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_custom_factors(:one).to_param
    assert_response :success
  end

  test "should update where_custom_factor" do
    put :update, :id => where_custom_factors(:one).to_param, :where_custom_factor => { }
    assert_redirected_to where_custom_factor_path(assigns(:where_custom_factor))
  end

  test "should destroy where_custom_factor" do
    assert_difference('WhereCustomFactor.count', -1) do
      delete :destroy, :id => where_custom_factors(:one).to_param
    end

    assert_redirected_to where_custom_factors_path
  end
end
