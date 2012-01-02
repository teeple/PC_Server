require 'test_helper'

class PrdAttributesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_attribute" do
    assert_difference('PrdAttribute.count') do
      post :create, :prd_attribute => { }
    end

    assert_redirected_to prd_attribute_path(assigns(:prd_attribute))
  end

  test "should show prd_attribute" do
    get :show, :id => prd_attributes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_attributes(:one).to_param
    assert_response :success
  end

  test "should update prd_attribute" do
    put :update, :id => prd_attributes(:one).to_param, :prd_attribute => { }
    assert_redirected_to prd_attribute_path(assigns(:prd_attribute))
  end

  test "should destroy prd_attribute" do
    assert_difference('PrdAttribute.count', -1) do
      delete :destroy, :id => prd_attributes(:one).to_param
    end

    assert_redirected_to prd_attributes_path
  end
end
