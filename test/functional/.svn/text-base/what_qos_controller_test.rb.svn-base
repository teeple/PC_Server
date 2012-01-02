require 'test_helper'

class WhatQosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_qos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_qo" do
    assert_difference('WhatQo.count') do
      post :create, :what_qo => { }
    end

    assert_redirected_to what_qo_path(assigns(:what_qo))
  end

  test "should show what_qo" do
    get :show, :id => what_qos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_qos(:one).to_param
    assert_response :success
  end

  test "should update what_qo" do
    put :update, :id => what_qos(:one).to_param, :what_qo => { }
    assert_redirected_to what_qo_path(assigns(:what_qo))
  end

  test "should destroy what_qo" do
    assert_difference('WhatQo.count', -1) do
      delete :destroy, :id => what_qos(:one).to_param
    end

    assert_redirected_to what_qos_path
  end
end
