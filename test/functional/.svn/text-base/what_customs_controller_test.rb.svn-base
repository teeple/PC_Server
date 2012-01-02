require 'test_helper'

class WhatCustomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_custom" do
    assert_difference('WhatCustom.count') do
      post :create, :what_custom => { }
    end

    assert_redirected_to what_custom_path(assigns(:what_custom))
  end

  test "should show what_custom" do
    get :show, :id => what_customs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_customs(:one).to_param
    assert_response :success
  end

  test "should update what_custom" do
    put :update, :id => what_customs(:one).to_param, :what_custom => { }
    assert_redirected_to what_custom_path(assigns(:what_custom))
  end

  test "should destroy what_custom" do
    assert_difference('WhatCustom.count', -1) do
      delete :destroy, :id => what_customs(:one).to_param
    end

    assert_redirected_to what_customs_path
  end
end
