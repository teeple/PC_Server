require 'test_helper'

class WhoFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_factor" do
    assert_difference('WhoFactor.count') do
      post :create, :who_factor => { }
    end

    assert_redirected_to who_factor_path(assigns(:who_factor))
  end

  test "should show who_factor" do
    get :show, :id => who_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_factors(:one).to_param
    assert_response :success
  end

  test "should update who_factor" do
    put :update, :id => who_factors(:one).to_param, :who_factor => { }
    assert_redirected_to who_factor_path(assigns(:who_factor))
  end

  test "should destroy who_factor" do
    assert_difference('WhoFactor.count', -1) do
      delete :destroy, :id => who_factors(:one).to_param
    end

    assert_redirected_to who_factors_path
  end
end
