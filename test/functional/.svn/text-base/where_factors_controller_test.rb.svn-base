require 'test_helper'

class WhereFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_factor" do
    assert_difference('WhereFactor.count') do
      post :create, :where_factor => { }
    end

    assert_redirected_to where_factor_path(assigns(:where_factor))
  end

  test "should show where_factor" do
    get :show, :id => where_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_factors(:one).to_param
    assert_response :success
  end

  test "should update where_factor" do
    put :update, :id => where_factors(:one).to_param, :where_factor => { }
    assert_redirected_to where_factor_path(assigns(:where_factor))
  end

  test "should destroy where_factor" do
    assert_difference('WhereFactor.count', -1) do
      delete :destroy, :id => where_factors(:one).to_param
    end

    assert_redirected_to where_factors_path
  end
end
