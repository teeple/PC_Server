require 'test_helper'

class WhenTimeslotFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_timeslot_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_timeslot_factor" do
    assert_difference('WhenTimeslotFactor.count') do
      post :create, :when_timeslot_factor => { }
    end

    assert_redirected_to when_timeslot_factor_path(assigns(:when_timeslot_factor))
  end

  test "should show when_timeslot_factor" do
    get :show, :id => when_timeslot_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_timeslot_factors(:one).to_param
    assert_response :success
  end

  test "should update when_timeslot_factor" do
    put :update, :id => when_timeslot_factors(:one).to_param, :when_timeslot_factor => { }
    assert_redirected_to when_timeslot_factor_path(assigns(:when_timeslot_factor))
  end

  test "should destroy when_timeslot_factor" do
    assert_difference('WhenTimeslotFactor.count', -1) do
      delete :destroy, :id => when_timeslot_factors(:one).to_param
    end

    assert_redirected_to when_timeslot_factors_path
  end
end
