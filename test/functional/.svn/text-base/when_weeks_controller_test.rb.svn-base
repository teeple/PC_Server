require 'test_helper'

class WhenWeeksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_weeks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_week" do
    assert_difference('WhenWeek.count') do
      post :create, :when_week => { }
    end

    assert_redirected_to when_week_path(assigns(:when_week))
  end

  test "should show when_week" do
    get :show, :id => when_weeks(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_weeks(:one).to_param
    assert_response :success
  end

  test "should update when_week" do
    put :update, :id => when_weeks(:one).to_param, :when_week => { }
    assert_redirected_to when_week_path(assigns(:when_week))
  end

  test "should destroy when_week" do
    assert_difference('WhenWeek.count', -1) do
      delete :destroy, :id => when_weeks(:one).to_param
    end

    assert_redirected_to when_weeks_path
  end
end
