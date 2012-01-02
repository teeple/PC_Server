require 'test_helper'

class WhenDurationFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_duration_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_duration_factor" do
    assert_difference('WhenDurationFactor.count') do
      post :create, :when_duration_factor => { }
    end

    assert_redirected_to when_duration_factor_path(assigns(:when_duration_factor))
  end

  test "should show when_duration_factor" do
    get :show, :id => when_duration_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_duration_factors(:one).to_param
    assert_response :success
  end

  test "should update when_duration_factor" do
    put :update, :id => when_duration_factors(:one).to_param, :when_duration_factor => { }
    assert_redirected_to when_duration_factor_path(assigns(:when_duration_factor))
  end

  test "should destroy when_duration_factor" do
    assert_difference('WhenDurationFactor.count', -1) do
      delete :destroy, :id => when_duration_factors(:one).to_param
    end

    assert_redirected_to when_duration_factors_path
  end
end
