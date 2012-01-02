require 'test_helper'

class PrdTariffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_tariffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_tariff" do
    assert_difference('PrdTariff.count') do
      post :create, :prd_tariff => { }
    end

    assert_redirected_to prd_tariff_path(assigns(:prd_tariff))
  end

  test "should show prd_tariff" do
    get :show, :id => prd_tariffs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_tariffs(:one).to_param
    assert_response :success
  end

  test "should update prd_tariff" do
    put :update, :id => prd_tariffs(:one).to_param, :prd_tariff => { }
    assert_redirected_to prd_tariff_path(assigns(:prd_tariff))
  end

  test "should destroy prd_tariff" do
    assert_difference('PrdTariff.count', -1) do
      delete :destroy, :id => prd_tariffs(:one).to_param
    end

    assert_redirected_to prd_tariffs_path
  end
end
