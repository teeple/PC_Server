require 'test_helper'

class CcbsBundleProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ccbs_bundle_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ccbs_bundle_product" do
    assert_difference('CcbsBundleProduct.count') do
      post :create, :ccbs_bundle_product => { }
    end

    assert_redirected_to ccbs_bundle_product_path(assigns(:ccbs_bundle_product))
  end

  test "should show ccbs_bundle_product" do
    get :show, :id => ccbs_bundle_products(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ccbs_bundle_products(:one).to_param
    assert_response :success
  end

  test "should update ccbs_bundle_product" do
    put :update, :id => ccbs_bundle_products(:one).to_param, :ccbs_bundle_product => { }
    assert_redirected_to ccbs_bundle_product_path(assigns(:ccbs_bundle_product))
  end

  test "should destroy ccbs_bundle_product" do
    assert_difference('CcbsBundleProduct.count', -1) do
      delete :destroy, :id => ccbs_bundle_products(:one).to_param
    end

    assert_redirected_to ccbs_bundle_products_path
  end
end
