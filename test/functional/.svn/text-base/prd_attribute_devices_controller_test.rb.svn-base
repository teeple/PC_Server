require 'test_helper'

class PrdAttributeDevicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_attribute_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_attribute_device" do
    assert_difference('PrdAttributeDevice.count') do
      post :create, :prd_attribute_device => { }
    end

    assert_redirected_to prd_attribute_device_path(assigns(:prd_attribute_device))
  end

  test "should show prd_attribute_device" do
    get :show, :id => prd_attribute_devices(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_attribute_devices(:one).to_param
    assert_response :success
  end

  test "should update prd_attribute_device" do
    put :update, :id => prd_attribute_devices(:one).to_param, :prd_attribute_device => { }
    assert_redirected_to prd_attribute_device_path(assigns(:prd_attribute_device))
  end

  test "should destroy prd_attribute_device" do
    assert_difference('PrdAttributeDevice.count', -1) do
      delete :destroy, :id => prd_attribute_devices(:one).to_param
    end

    assert_redirected_to prd_attribute_devices_path
  end
end
