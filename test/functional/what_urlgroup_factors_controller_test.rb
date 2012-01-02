require 'test_helper'

class WhatUrlgroupFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_urlgroup_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_urlgroup_factor" do
    assert_difference('WhatUrlgroupFactor.count') do
      post :create, :what_urlgroup_factor => { }
    end

    assert_redirected_to what_urlgroup_factor_path(assigns(:what_urlgroup_factor))
  end

  test "should show what_urlgroup_factor" do
    get :show, :id => what_urlgroup_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_urlgroup_factors(:one).to_param
    assert_response :success
  end

  test "should update what_urlgroup_factor" do
    put :update, :id => what_urlgroup_factors(:one).to_param, :what_urlgroup_factor => { }
    assert_redirected_to what_urlgroup_factor_path(assigns(:what_urlgroup_factor))
  end

  test "should destroy what_urlgroup_factor" do
    assert_difference('WhatUrlgroupFactor.count', -1) do
      delete :destroy, :id => what_urlgroup_factors(:one).to_param
    end

    assert_redirected_to what_urlgroup_factors_path
  end
end
