require 'test_helper'

class PrdPromotionRulesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_promotion_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_promotion_rule" do
    assert_difference('PrdPromotionRule.count') do
      post :create, :prd_promotion_rule => { }
    end

    assert_redirected_to prd_promotion_rule_path(assigns(:prd_promotion_rule))
  end

  test "should show prd_promotion_rule" do
    get :show, :id => prd_promotion_rules(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_promotion_rules(:one).to_param
    assert_response :success
  end

  test "should update prd_promotion_rule" do
    put :update, :id => prd_promotion_rules(:one).to_param, :prd_promotion_rule => { }
    assert_redirected_to prd_promotion_rule_path(assigns(:prd_promotion_rule))
  end

  test "should destroy prd_promotion_rule" do
    assert_difference('PrdPromotionRule.count', -1) do
      delete :destroy, :id => prd_promotion_rules(:one).to_param
    end

    assert_redirected_to prd_promotion_rules_path
  end
end
