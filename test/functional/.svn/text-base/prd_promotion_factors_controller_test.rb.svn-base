require 'test_helper'

class PrdPromotionFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_promotion_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_promotion_factor" do
    assert_difference('PrdPromotionFactor.count') do
      post :create, :prd_promotion_factor => { }
    end

    assert_redirected_to prd_promotion_factor_path(assigns(:prd_promotion_factor))
  end

  test "should show prd_promotion_factor" do
    get :show, :id => prd_promotion_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_promotion_factors(:one).to_param
    assert_response :success
  end

  test "should update prd_promotion_factor" do
    put :update, :id => prd_promotion_factors(:one).to_param, :prd_promotion_factor => { }
    assert_redirected_to prd_promotion_factor_path(assigns(:prd_promotion_factor))
  end

  test "should destroy prd_promotion_factor" do
    assert_difference('PrdPromotionFactor.count', -1) do
      delete :destroy, :id => prd_promotion_factors(:one).to_param
    end

    assert_redirected_to prd_promotion_factors_path
  end
end
