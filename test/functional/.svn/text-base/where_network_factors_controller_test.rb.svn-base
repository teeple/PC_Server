require 'test_helper'

class WhereNetworkFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_network_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_network_factor" do
    assert_difference('WhereNetworkFactor.count') do
      post :create, :where_network_factor => { }
    end

    assert_redirected_to where_network_factor_path(assigns(:where_network_factor))
  end

  test "should show where_network_factor" do
    get :show, :id => where_network_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_network_factors(:one).to_param
    assert_response :success
  end

  test "should update where_network_factor" do
    put :update, :id => where_network_factors(:one).to_param, :where_network_factor => { }
    assert_redirected_to where_network_factor_path(assigns(:where_network_factor))
  end

  test "should destroy where_network_factor" do
    assert_difference('WhereNetworkFactor.count', -1) do
      delete :destroy, :id => where_network_factors(:one).to_param
    end

    assert_redirected_to where_network_factors_path
  end
end
