require 'test_helper'

class OcsRatingFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ocs_rating_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ocs_rating_factor" do
    assert_difference('OcsRatingFactor.count') do
      post :create, :ocs_rating_factor => { }
    end

    assert_redirected_to ocs_rating_factor_path(assigns(:ocs_rating_factor))
  end

  test "should show ocs_rating_factor" do
    get :show, :id => ocs_rating_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ocs_rating_factors(:one).to_param
    assert_response :success
  end

  test "should update ocs_rating_factor" do
    put :update, :id => ocs_rating_factors(:one).to_param, :ocs_rating_factor => { }
    assert_redirected_to ocs_rating_factor_path(assigns(:ocs_rating_factor))
  end

  test "should destroy ocs_rating_factor" do
    assert_difference('OcsRatingFactor.count', -1) do
      delete :destroy, :id => ocs_rating_factors(:one).to_param
    end

    assert_redirected_to ocs_rating_factors_path
  end
end
