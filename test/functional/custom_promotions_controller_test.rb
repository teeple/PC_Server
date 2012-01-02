require 'test_helper'

class CustomPromotionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create custom_promotion" do
    assert_difference('CustomPromotion.count') do
      post :create, :custom_promotion => { }
    end

    assert_redirected_to custom_promotion_path(assigns(:custom_promotion))
  end

  test "should show custom_promotion" do
    get :show, :id => custom_promotions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => custom_promotions(:one).to_param
    assert_response :success
  end

  test "should update custom_promotion" do
    put :update, :id => custom_promotions(:one).to_param, :custom_promotion => { }
    assert_redirected_to custom_promotion_path(assigns(:custom_promotion))
  end

  test "should destroy custom_promotion" do
    assert_difference('CustomPromotion.count', -1) do
      delete :destroy, :id => custom_promotions(:one).to_param
    end

    assert_redirected_to custom_promotions_path
  end
end
