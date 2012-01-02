require 'test_helper'

class WhatUrlgroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:what_urlgroups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create what_urlgroup" do
    assert_difference('WhatUrlgroup.count') do
      post :create, :what_urlgroup => { }
    end

    assert_redirected_to what_urlgroup_path(assigns(:what_urlgroup))
  end

  test "should show what_urlgroup" do
    get :show, :id => what_urlgroups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => what_urlgroups(:one).to_param
    assert_response :success
  end

  test "should update what_urlgroup" do
    put :update, :id => what_urlgroups(:one).to_param, :what_urlgroup => { }
    assert_redirected_to what_urlgroup_path(assigns(:what_urlgroup))
  end

  test "should destroy what_urlgroup" do
    assert_difference('WhatUrlgroup.count', -1) do
      delete :destroy, :id => what_urlgroups(:one).to_param
    end

    assert_redirected_to what_urlgroups_path
  end
end
