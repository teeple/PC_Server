require 'test_helper'

class CrmProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crm_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crm_product" do
    assert_difference('CrmProduct.count') do
      post :create, :crm_product => { }
    end

    assert_redirected_to crm_product_path(assigns(:crm_product))
  end

  test "should show crm_product" do
    get :show, :id => crm_products(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => crm_products(:one).to_param
    assert_response :success
  end

  test "should update crm_product" do
    put :update, :id => crm_products(:one).to_param, :crm_product => { }
    assert_redirected_to crm_product_path(assigns(:crm_product))
  end

  test "should destroy crm_product" do
    assert_difference('CrmProduct.count', -1) do
      delete :destroy, :id => crm_products(:one).to_param
    end

    assert_redirected_to crm_products_path
  end
end
