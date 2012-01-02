require 'test_helper'

class WhatFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_factor" do
    assert_difference('WhatFactor.count') do
      post :create, :what_factor => { }
    end

    assert_redirected_to what_factor_path(assigns(:what_factor))
  end

  test "should show what_factor" do
    get :show, :id => what_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_factors(:one).to_param
    assert_response :success
  end

  test "should update what_factor" do
    put :update, :id => what_factors(:one).to_param, :what_factor => { }
    assert_redirected_to what_factor_path(assigns(:what_factor))
  end

  test "should destroy what_factor" do
    assert_difference('WhatFactor.count', -1) do
      delete :destroy, :id => what_factors(:one).to_param
    end

    assert_redirected_to what_factors_path
  end
end
