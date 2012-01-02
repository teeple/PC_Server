require 'test_helper'

class PrdBalanceConditionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_balance_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_balance_condition" do
    assert_difference('PrdBalanceCondition.count') do
      post :create, :prd_balance_condition => { }
    end

    assert_redirected_to prd_balance_condition_path(assigns(:prd_balance_condition))
  end

  test "should show prd_balance_condition" do
    get :show, :id => prd_balance_conditions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_balance_conditions(:one).to_param
    assert_response :success
  end

  test "should update prd_balance_condition" do
    put :update, :id => prd_balance_conditions(:one).to_param, :prd_balance_condition => { }
    assert_redirected_to prd_balance_condition_path(assigns(:prd_balance_condition))
  end

  test "should destroy prd_balance_condition" do
    assert_difference('PrdBalanceCondition.count', -1) do
      delete :destroy, :id => prd_balance_conditions(:one).to_param
    end

    assert_redirected_to prd_balance_conditions_path
  end
end
