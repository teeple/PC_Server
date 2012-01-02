require 'test_helper'

class CcbsProductTariffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ccbs_product_tariffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ccbs_product_tariff" do
    assert_difference('CcbsProductTariff.count') do
      post :create, :ccbs_product_tariff => { }
    end

    assert_redirected_to ccbs_product_tariff_path(assigns(:ccbs_product_tariff))
  end

  test "should show ccbs_product_tariff" do
    get :show, :id => ccbs_product_tariffs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ccbs_product_tariffs(:one).to_param
    assert_response :success
  end

  test "should update ccbs_product_tariff" do
    put :update, :id => ccbs_product_tariffs(:one).to_param, :ccbs_product_tariff => { }
    assert_redirected_to ccbs_product_tariff_path(assigns(:ccbs_product_tariff))
  end

  test "should destroy ccbs_product_tariff" do
    assert_difference('CcbsProductTariff.count', -1) do
      delete :destroy, :id => ccbs_product_tariffs(:one).to_param
    end

    assert_redirected_to ccbs_product_tariffs_path
  end
end
