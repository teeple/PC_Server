require 'test_helper'

class PrdAdditionalServicesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_additional_services)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_additional_service" do
    assert_difference('PrdAdditionalService.count') do
      post :create, :prd_additional_service => { }
    end

    assert_redirected_to prd_additional_service_path(assigns(:prd_additional_service))
  end

  test "should show prd_additional_service" do
    get :show, :id => prd_additional_services(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_additional_services(:one).to_param
    assert_response :success
  end

  test "should update prd_additional_service" do
    put :update, :id => prd_additional_services(:one).to_param, :prd_additional_service => { }
    assert_redirected_to prd_additional_service_path(assigns(:prd_additional_service))
  end

  test "should destroy prd_additional_service" do
    assert_difference('PrdAdditionalService.count', -1) do
      delete :destroy, :id => prd_additional_services(:one).to_param
    end

    assert_redirected_to prd_additional_services_path
  end
end
