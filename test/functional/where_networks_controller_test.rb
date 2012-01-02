require 'test_helper'

class WhereNetworksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_networks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_network" do
    assert_difference('WhereNetwork.count') do
      post :create, :where_network => { }
    end

    assert_redirected_to where_network_path(assigns(:where_network))
  end

  test "should show where_network" do
    get :show, :id => where_networks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_networks(:one).to_param
    assert_response :success
  end

  test "should update where_network" do
    put :update, :id => where_networks(:one).to_param, :where_network => { }
    assert_redirected_to where_network_path(assigns(:where_network))
  end

  test "should destroy where_network" do
    assert_difference('WhereNetwork.count', -1) do
      delete :destroy, :id => where_networks(:one).to_param
    end

    assert_redirected_to where_networks_path
  end
end
