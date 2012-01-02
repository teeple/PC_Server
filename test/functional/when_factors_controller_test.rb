require 'test_helper'

class WhenFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_factor" do
    assert_difference('WhenFactor.count') do
      post :create, :when_factor => { }
    end

    assert_redirected_to when_factor_path(assigns(:when_factor))
  end

  test "should show when_factor" do
    get :show, :id => when_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_factors(:one).to_param
    assert_response :success
  end

  test "should update when_factor" do
    put :update, :id => when_factors(:one).to_param, :when_factor => { }
    assert_redirected_to when_factor_path(assigns(:when_factor))
  end

  test "should destroy when_factor" do
    assert_difference('WhenFactor.count', -1) do
      delete :destroy, :id => when_factors(:one).to_param
    end

    assert_redirected_to when_factors_path
  end
end
