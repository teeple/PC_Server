require 'test_helper'

class PrdSubscriptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_subscriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_subscription" do
    assert_difference('PrdSubscription.count') do
      post :create, :prd_subscription => { }
    end

    assert_redirected_to prd_subscription_path(assigns(:prd_subscription))
  end

  test "should show prd_subscription" do
    get :show, :id => prd_subscriptions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_subscriptions(:one).to_param
    assert_response :success
  end

  test "should update prd_subscription" do
    put :update, :id => prd_subscriptions(:one).to_param, :prd_subscription => { }
    assert_redirected_to prd_subscription_path(assigns(:prd_subscription))
  end

  test "should destroy prd_subscription" do
    assert_difference('PrdSubscription.count', -1) do
      delete :destroy, :id => prd_subscriptions(:one).to_param
    end

    assert_redirected_to prd_subscriptions_path
  end
end
