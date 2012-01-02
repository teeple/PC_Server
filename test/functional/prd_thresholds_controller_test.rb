require 'test_helper'

class PrdThresholdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_thresholds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_threshold" do
    assert_difference('PrdThreshold.count') do
      post :create, :prd_threshold => { }
    end

    assert_redirected_to prd_threshold_path(assigns(:prd_threshold))
  end

  test "should show prd_threshold" do
    get :show, :id => prd_thresholds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_thresholds(:one).to_param
    assert_response :success
  end

  test "should update prd_threshold" do
    put :update, :id => prd_thresholds(:one).to_param, :prd_threshold => { }
    assert_redirected_to prd_threshold_path(assigns(:prd_threshold))
  end

  test "should destroy prd_threshold" do
    assert_difference('PrdThreshold.count', -1) do
      delete :destroy, :id => prd_thresholds(:one).to_param
    end

    assert_redirected_to prd_thresholds_path
  end
end
