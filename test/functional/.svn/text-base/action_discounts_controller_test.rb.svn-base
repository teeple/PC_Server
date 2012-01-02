require 'test_helper'

class ActionDiscountsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:action_discounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create action_discount" do
    assert_difference('ActionDiscount.count') do
      post :create, :action_discount => { }
    end

    assert_redirected_to action_discount_path(assigns(:action_discount))
  end

  test "should show action_discount" do
    get :show, :id => action_discounts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => action_discounts(:one).to_param
    assert_response :success
  end

  test "should update action_discount" do
    put :update, :id => action_discounts(:one).to_param, :action_discount => { }
    assert_redirected_to action_discount_path(assigns(:action_discount))
  end

  test "should destroy action_discount" do
    assert_difference('ActionDiscount.count', -1) do
      delete :destroy, :id => action_discounts(:one).to_param
    end

    assert_redirected_to action_discounts_path
  end
end
