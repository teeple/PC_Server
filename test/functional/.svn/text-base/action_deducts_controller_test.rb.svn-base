require 'test_helper'

class ActionDeductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_deducts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_deduct" do
    assert_difference('ActionDeduct.count') do
      post :create, :action_deduct => { }
    end

    assert_redirected_to action_deduct_path(assigns(:action_deduct))
  end

  test "should show action_deduct" do
    get :show, :id => action_deducts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_deducts(:one).to_param
    assert_response :success
  end

  test "should update action_deduct" do
    put :update, :id => action_deducts(:one).to_param, :action_deduct => { }
    assert_redirected_to action_deduct_path(assigns(:action_deduct))
  end

  test "should destroy action_deduct" do
    assert_difference('ActionDeduct.count', -1) do
      delete :destroy, :id => action_deducts(:one).to_param
    end

    assert_redirected_to action_deducts_path
  end
end
