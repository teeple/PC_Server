require 'test_helper'

class TariffFileListsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tariff_file_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tariff_file_list" do
    assert_difference('TariffFileList.count') do
      post :create, :tariff_file_list => { }
    end

    assert_redirected_to tariff_file_list_path(assigns(:tariff_file_list))
  end

  test "should show tariff_file_list" do
    get :show, :id => tariff_file_lists(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tariff_file_lists(:one).to_param
    assert_response :success
  end

  test "should update tariff_file_list" do
    put :update, :id => tariff_file_lists(:one).to_param, :tariff_file_list => { }
    assert_redirected_to tariff_file_list_path(assigns(:tariff_file_list))
  end

  test "should destroy tariff_file_list" do
    assert_difference('TariffFileList.count', -1) do
      delete :destroy, :id => tariff_file_lists(:one).to_param
    end

    assert_redirected_to tariff_file_lists_path
  end
end
