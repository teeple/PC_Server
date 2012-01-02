require 'test_helper'

class CsProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cs_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cs_product" do
    assert_difference('CsProduct.count') do
      post :create, :cs_product => { }
    end

    assert_redirected_to cs_product_path(assigns(:cs_product))
  end

  test "should show cs_product" do
    get :show, :id => cs_products(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cs_products(:one).to_param
    assert_response :success
  end

  test "should update cs_product" do
    put :update, :id => cs_products(:one).to_param, :cs_product => { }
    assert_redirected_to cs_product_path(assigns(:cs_product))
  end

  test "should destroy cs_product" do
    assert_difference('CsProduct.count', -1) do
      delete :destroy, :id => cs_products(:one).to_param
    end

    assert_redirected_to cs_products_path
  end
end
