require 'test_helper'

class WhenDayFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_day_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_day_factor" do
    assert_difference('WhenDayFactor.count') do
      post :create, :when_day_factor => { }
    end

    assert_redirected_to when_day_factor_path(assigns(:when_day_factor))
  end

  test "should show when_day_factor" do
    get :show, :id => when_day_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_day_factors(:one).to_param
    assert_response :success
  end

  test "should update when_day_factor" do
    put :update, :id => when_day_factors(:one).to_param, :when_day_factor => { }
    assert_redirected_to when_day_factor_path(assigns(:when_day_factor))
  end

  test "should destroy when_day_factor" do
    assert_difference('WhenDayFactor.count', -1) do
      delete :destroy, :id => when_day_factors(:one).to_param
    end

    assert_redirected_to when_day_factors_path
  end
end
