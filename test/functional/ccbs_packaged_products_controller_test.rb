require 'test_helper'

class CcbsPackagedProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ccbs_packaged_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ccbs_packaged_product" do
    assert_difference('CcbsPackagedProduct.count') do
      post :create, :ccbs_packaged_product => { }
    end

    assert_redirected_to ccbs_packaged_product_path(assigns(:ccbs_packaged_product))
  end

  test "should show ccbs_packaged_product" do
    get :show, :id => ccbs_packaged_products(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ccbs_packaged_products(:one).to_param
    assert_response :success
  end

  test "should update ccbs_packaged_product" do
    put :update, :id => ccbs_packaged_products(:one).to_param, :ccbs_packaged_product => { }
    assert_redirected_to ccbs_packaged_product_path(assigns(:ccbs_packaged_product))
  end

  test "should destroy ccbs_packaged_product" do
    assert_difference('CcbsPackagedProduct.count', -1) do
      delete :destroy, :id => ccbs_packaged_products(:one).to_param
    end

    assert_redirected_to ccbs_packaged_products_path
  end
end
