require 'test_helper'

class PromotionFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotion_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion_factor" do
    assert_difference('PromotionFactor.count') do
      post :create, :promotion_factor => { }
    end

    assert_redirected_to promotion_factor_path(assigns(:promotion_factor))
  end

  test "should show promotion_factor" do
    get :show, :id => promotion_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => promotion_factors(:one).to_param
    assert_response :success
  end

  test "should update promotion_factor" do
    put :update, :id => promotion_factors(:one).to_param, :promotion_factor => { }
    assert_redirected_to promotion_factor_path(assigns(:promotion_factor))
  end

  test "should destroy promotion_factor" do
    assert_difference('PromotionFactor.count', -1) do
      delete :destroy, :id => promotion_factors(:one).to_param
    end

    assert_redirected_to promotion_factors_path
  end
end
