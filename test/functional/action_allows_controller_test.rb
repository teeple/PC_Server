require 'test_helper'

class ActionAllowsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_allows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_allow" do
    assert_difference('ActionAllow.count') do
      post :create, :action_allow => { }
    end

    assert_redirected_to action_allow_path(assigns(:action_allow))
  end

  test "should show action_allow" do
    get :show, :id => action_allows(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_allows(:one).to_param
    assert_response :success
  end

  test "should update action_allow" do
    put :update, :id => action_allows(:one).to_param, :action_allow => { }
    assert_redirected_to action_allow_path(assigns(:action_allow))
  end

  test "should destroy action_allow" do
    assert_difference('ActionAllow.count', -1) do
      delete :destroy, :id => action_allows(:one).to_param
    end

    assert_redirected_to action_allows_path
  end
end
