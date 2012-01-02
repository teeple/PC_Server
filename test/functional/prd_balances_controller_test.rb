require 'test_helper'

class PrdBalancesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_balance" do
    assert_difference('PrdBalance.count') do
      post :create, :prd_balance => { }
    end

    assert_redirected_to prd_balance_path(assigns(:prd_balance))
  end

  test "should show prd_balance" do
    get :show, :id => prd_balances(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_balances(:one).to_param
    assert_response :success
  end

  test "should update prd_balance" do
    put :update, :id => prd_balances(:one).to_param, :prd_balance => { }
    assert_redirected_to prd_balance_path(assigns(:prd_balance))
  end

  test "should destroy prd_balance" do
    assert_difference('PrdBalance.count', -1) do
      delete :destroy, :id => prd_balances(:one).to_param
    end

    assert_redirected_to prd_balances_path
  end
end
