require 'test_helper'

class CsProductVasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cs_product_vas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cs_product_va" do
    assert_difference('CsProductVa.count') do
      post :create, :cs_product_va => { }
    end

    assert_redirected_to cs_product_va_path(assigns(:cs_product_va))
  end

  test "should show cs_product_va" do
    get :show, :id => cs_product_vas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cs_product_vas(:one).to_param
    assert_response :success
  end

  test "should update cs_product_va" do
    put :update, :id => cs_product_vas(:one).to_param, :cs_product_va => { }
    assert_redirected_to cs_product_va_path(assigns(:cs_product_va))
  end

  test "should destroy cs_product_va" do
    assert_difference('CsProductVa.count', -1) do
      delete :destroy, :id => cs_product_vas(:one).to_param
    end

    assert_redirected_to cs_product_vas_path
  end
end
