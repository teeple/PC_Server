require 'test_helper'

class TariffsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tariffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tariff" do
    assert_difference('Tariff.count') do
      post :create, :tariff => { }
    end

    assert_redirected_to tariff_path(assigns(:tariff))
  end

  test "should show tariff" do
    get :show, :id => tariffs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tariffs(:one).to_param
    assert_response :success
  end

  test "should update tariff" do
    put :update, :id => tariffs(:one).to_param, :tariff => { }
    assert_redirected_to tariff_path(assigns(:tariff))
  end

  test "should destroy tariff" do
    assert_difference('Tariff.count', -1) do
      delete :destroy, :id => tariffs(:one).to_param
    end

    assert_redirected_to tariffs_path
  end
end
