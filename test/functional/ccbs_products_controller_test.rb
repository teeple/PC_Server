require 'test_helper'

class CcbsProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ccbs_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ccbs_product" do
    assert_difference('CcbsProduct.count') do
      post :create, :ccbs_product => { }
    end

    assert_redirected_to ccbs_product_path(assigns(:ccbs_product))
  end

  test "should show ccbs_product" do
    get :show, :id => ccbs_products(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ccbs_products(:one).to_param
    assert_response :success
  end

  test "should update ccbs_product" do
    put :update, :id => ccbs_products(:one).to_param, :ccbs_product => { }
    assert_redirected_to ccbs_product_path(assigns(:ccbs_product))
  end

  test "should destroy ccbs_product" do
    assert_difference('CcbsProduct.count', -1) do
      delete :destroy, :id => ccbs_products(:one).to_param
    end

    assert_redirected_to ccbs_products_path
  end
end
