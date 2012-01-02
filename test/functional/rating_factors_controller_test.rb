require 'test_helper'

class RatingFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rating_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rating_factor" do
    assert_difference('RatingFactor.count') do
      post :create, :rating_factor => { }
    end

    assert_redirected_to rating_factor_path(assigns(:rating_factor))
  end

  test "should show rating_factor" do
    get :show, :id => rating_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => rating_factors(:one).to_param
    assert_response :success
  end

  test "should update rating_factor" do
    put :update, :id => rating_factors(:one).to_param, :rating_factor => { }
    assert_redirected_to rating_factor_path(assigns(:rating_factor))
  end

  test "should destroy rating_factor" do
    assert_difference('RatingFactor.count', -1) do
      delete :destroy, :id => rating_factors(:one).to_param
    end

    assert_redirected_to rating_factors_path
  end
end
