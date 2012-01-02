require 'test_helper'

class TariffListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tariff_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tariff_list" do
    assert_difference('TariffList.count') do
      post :create, :tariff_list => { }
    end

    assert_redirected_to tariff_list_path(assigns(:tariff_list))
  end

  test "should show tariff_list" do
    get :show, :id => tariff_lists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tariff_lists(:one).to_param
    assert_response :success
  end

  test "should update tariff_list" do
    put :update, :id => tariff_lists(:one).to_param, :tariff_list => { }
    assert_redirected_to tariff_list_path(assigns(:tariff_list))
  end

  test "should destroy tariff_list" do
    assert_difference('TariffList.count', -1) do
      delete :destroy, :id => tariff_lists(:one).to_param
    end

    assert_redirected_to tariff_lists_path
  end
end
