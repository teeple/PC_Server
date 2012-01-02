require 'test_helper'

class WhenDaysControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_days)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_day" do
    assert_difference('WhenDay.count') do
      post :create, :when_day => { }
    end

    assert_redirected_to when_day_path(assigns(:when_day))
  end

  test "should show when_day" do
    get :show, :id => when_days(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_days(:one).to_param
    assert_response :success
  end

  test "should update when_day" do
    put :update, :id => when_days(:one).to_param, :when_day => { }
    assert_redirected_to when_day_path(assigns(:when_day))
  end

  test "should destroy when_day" do
    assert_difference('WhenDay.count', -1) do
      delete :destroy, :id => when_days(:one).to_param
    end

    assert_redirected_to when_days_path
  end
end
