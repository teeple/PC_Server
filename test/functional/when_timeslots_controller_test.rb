require 'test_helper'

class WhenTimeslotsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_timeslots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_timeslot" do
    assert_difference('WhenTimeslot.count') do
      post :create, :when_timeslot => { }
    end

    assert_redirected_to when_timeslot_path(assigns(:when_timeslot))
  end

  test "should show when_timeslot" do
    get :show, :id => when_timeslots(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_timeslots(:one).to_param
    assert_response :success
  end

  test "should update when_timeslot" do
    put :update, :id => when_timeslots(:one).to_param, :when_timeslot => { }
    assert_redirected_to when_timeslot_path(assigns(:when_timeslot))
  end

  test "should destroy when_timeslot" do
    assert_difference('WhenTimeslot.count', -1) do
      delete :destroy, :id => when_timeslots(:one).to_param
    end

    assert_redirected_to when_timeslots_path
  end
end
