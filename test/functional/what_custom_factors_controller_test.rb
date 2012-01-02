require 'test_helper'

class WhatCustomFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_custom_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_custom_factor" do
    assert_difference('WhatCustomFactor.count') do
      post :create, :what_custom_factor => { }
    end

    assert_redirected_to what_custom_factor_path(assigns(:what_custom_factor))
  end

  test "should show what_custom_factor" do
    get :show, :id => what_custom_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_custom_factors(:one).to_param
    assert_response :success
  end

  test "should update what_custom_factor" do
    put :update, :id => what_custom_factors(:one).to_param, :what_custom_factor => { }
    assert_redirected_to what_custom_factor_path(assigns(:what_custom_factor))
  end

  test "should destroy what_custom_factor" do
    assert_difference('WhatCustomFactor.count', -1) do
      delete :destroy, :id => what_custom_factors(:one).to_param
    end

    assert_redirected_to what_custom_factors_path
  end
end
