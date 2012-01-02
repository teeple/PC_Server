require 'test_helper'

class WhoPrefixFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_prefix_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_prefix_factor" do
    assert_difference('WhoPrefixFactor.count') do
      post :create, :who_prefix_factor => { }
    end

    assert_redirected_to who_prefix_factor_path(assigns(:who_prefix_factor))
  end

  test "should show who_prefix_factor" do
    get :show, :id => who_prefix_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_prefix_factors(:one).to_param
    assert_response :success
  end

  test "should update who_prefix_factor" do
    put :update, :id => who_prefix_factors(:one).to_param, :who_prefix_factor => { }
    assert_redirected_to who_prefix_factor_path(assigns(:who_prefix_factor))
  end

  test "should destroy who_prefix_factor" do
    assert_difference('WhoPrefixFactor.count', -1) do
      delete :destroy, :id => who_prefix_factors(:one).to_param
    end

    assert_redirected_to who_prefix_factors_path
  end
end
