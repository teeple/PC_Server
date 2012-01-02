require 'test_helper'

class WhereZonesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_zones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_zone" do
    assert_difference('WhereZone.count') do
      post :create, :where_zone => { }
    end

    assert_redirected_to where_zone_path(assigns(:where_zone))
  end

  test "should show where_zone" do
    get :show, :id => where_zones(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_zones(:one).to_param
    assert_response :success
  end

  test "should update where_zone" do
    put :update, :id => where_zones(:one).to_param, :where_zone => { }
    assert_redirected_to where_zone_path(assigns(:where_zone))
  end

  test "should destroy where_zone" do
    assert_difference('WhereZone.count', -1) do
      delete :destroy, :id => where_zones(:one).to_param
    end

    assert_redirected_to where_zones_path
  end
end
