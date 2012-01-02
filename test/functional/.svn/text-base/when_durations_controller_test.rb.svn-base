require 'test_helper'

class WhenDurationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_durations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_duration" do
    assert_difference('WhenDuration.count') do
      post :create, :when_duration => { }
    end

    assert_redirected_to when_duration_path(assigns(:when_duration))
  end

  test "should show when_duration" do
    get :show, :id => when_durations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_durations(:one).to_param
    assert_response :success
  end

  test "should update when_duration" do
    put :update, :id => when_durations(:one).to_param, :when_duration => { }
    assert_redirected_to when_duration_path(assigns(:when_duration))
  end

  test "should destroy when_duration" do
    assert_difference('WhenDuration.count', -1) do
      delete :destroy, :id => when_durations(:one).to_param
    end

    assert_redirected_to when_durations_path
  end
end
