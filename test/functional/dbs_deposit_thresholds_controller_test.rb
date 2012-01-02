require 'test_helper'

class DbsDepositThresholdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dbs_deposit_thresholds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dbs_deposit_threshold" do
    assert_difference('DbsDepositThreshold.count') do
      post :create, :dbs_deposit_threshold => { }
    end

    assert_redirected_to dbs_deposit_threshold_path(assigns(:dbs_deposit_threshold))
  end

  test "should show dbs_deposit_threshold" do
    get :show, :id => dbs_deposit_thresholds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dbs_deposit_thresholds(:one).to_param
    assert_response :success
  end

  test "should update dbs_deposit_threshold" do
    put :update, :id => dbs_deposit_thresholds(:one).to_param, :dbs_deposit_threshold => { }
    assert_redirected_to dbs_deposit_threshold_path(assigns(:dbs_deposit_threshold))
  end

  test "should destroy dbs_deposit_threshold" do
    assert_difference('DbsDepositThreshold.count', -1) do
      delete :destroy, :id => dbs_deposit_thresholds(:one).to_param
    end

    assert_redirected_to dbs_deposit_thresholds_path
  end
end
