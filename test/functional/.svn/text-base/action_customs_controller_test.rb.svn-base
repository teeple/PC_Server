require 'test_helper'

class ActionCustomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_custom" do
    assert_difference('ActionCustom.count') do
      post :create, :action_custom => { }
    end

    assert_redirected_to action_custom_path(assigns(:action_custom))
  end

  test "should show action_custom" do
    get :show, :id => action_customs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_customs(:one).to_param
    assert_response :success
  end

  test "should update action_custom" do
    put :update, :id => action_customs(:one).to_param, :action_custom => { }
    assert_redirected_to action_custom_path(assigns(:action_custom))
  end

  test "should destroy action_custom" do
    assert_difference('ActionCustom.count', -1) do
      delete :destroy, :id => action_customs(:one).to_param
    end

    assert_redirected_to action_customs_path
  end
end
