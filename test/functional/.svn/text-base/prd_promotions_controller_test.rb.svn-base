require 'test_helper'

class PrdPromotionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_promotion" do
    assert_difference('PrdPromotion.count') do
      post :create, :prd_promotion => { }
    end

    assert_redirected_to prd_promotion_path(assigns(:prd_promotion))
  end

  test "should show prd_promotion" do
    get :show, :id => prd_promotions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_promotions(:one).to_param
    assert_response :success
  end

  test "should update prd_promotion" do
    put :update, :id => prd_promotions(:one).to_param, :prd_promotion => { }
    assert_redirected_to prd_promotion_path(assigns(:prd_promotion))
  end

  test "should destroy prd_promotion" do
    assert_difference('PrdPromotion.count', -1) do
      delete :destroy, :id => prd_promotions(:one).to_param
    end

    assert_redirected_to prd_promotions_path
  end
end
