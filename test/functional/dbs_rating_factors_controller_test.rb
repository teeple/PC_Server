require 'test_helper'

class DbsRatingFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dbs_rating_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dbs_rating_factor" do
    assert_difference('DbsRatingFactor.count') do
      post :create, :dbs_rating_factor => { }
    end

    assert_redirected_to dbs_rating_factor_path(assigns(:dbs_rating_factor))
  end

  test "should show dbs_rating_factor" do
    get :show, :id => dbs_rating_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dbs_rating_factors(:one).to_param
    assert_response :success
  end

  test "should update dbs_rating_factor" do
    put :update, :id => dbs_rating_factors(:one).to_param, :dbs_rating_factor => { }
    assert_redirected_to dbs_rating_factor_path(assigns(:dbs_rating_factor))
  end

  test "should destroy dbs_rating_factor" do
    assert_difference('DbsRatingFactor.count', -1) do
      delete :destroy, :id => dbs_rating_factors(:one).to_param
    end

    assert_redirected_to dbs_rating_factors_path
  end
end
