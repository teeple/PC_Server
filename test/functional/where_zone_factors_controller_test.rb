require 'test_helper'

class WhereZoneFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_zone_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_zone_factor" do
    assert_difference('WhereZoneFactor.count') do
      post :create, :where_zone_factor => { }
    end

    assert_redirected_to where_zone_factor_path(assigns(:where_zone_factor))
  end

  test "should show where_zone_factor" do
    get :show, :id => where_zone_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_zone_factors(:one).to_param
    assert_response :success
  end

  test "should update where_zone_factor" do
    put :update, :id => where_zone_factors(:one).to_param, :where_zone_factor => { }
    assert_redirected_to where_zone_factor_path(assigns(:where_zone_factor))
  end

  test "should destroy where_zone_factor" do
    assert_difference('WhereZoneFactor.count', -1) do
      delete :destroy, :id => where_zone_factors(:one).to_param
    end

    assert_redirected_to where_zone_factors_path
  end
end
