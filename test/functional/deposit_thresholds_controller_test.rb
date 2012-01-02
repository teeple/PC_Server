require 'test_helper'

class DepositThresholdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deposit_thresholds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deposit_threshold" do
    assert_difference('DepositThreshold.count') do
      post :create, :deposit_threshold => { }
    end

    assert_redirected_to deposit_threshold_path(assigns(:deposit_threshold))
  end

  test "should show deposit_threshold" do
    get :show, :id => deposit_thresholds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => deposit_thresholds(:one).to_param
    assert_response :success
  end

  test "should update deposit_threshold" do
    put :update, :id => deposit_thresholds(:one).to_param, :deposit_threshold => { }
    assert_redirected_to deposit_threshold_path(assigns(:deposit_threshold))
  end

  test "should destroy deposit_threshold" do
    assert_difference('DepositThreshold.count', -1) do
      delete :destroy, :id => deposit_thresholds(:one).to_param
    end

    assert_redirected_to deposit_thresholds_path
  end
end
