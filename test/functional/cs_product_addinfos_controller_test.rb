require 'test_helper'

class CsProductAddinfosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cs_product_addinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cs_product_addinfo" do
    assert_difference('CsProductAddinfo.count') do
      post :create, :cs_product_addinfo => { }
    end

    assert_redirected_to cs_product_addinfo_path(assigns(:cs_product_addinfo))
  end

  test "should show cs_product_addinfo" do
    get :show, :id => cs_product_addinfos(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cs_product_addinfos(:one).to_param
    assert_response :success
  end

  test "should update cs_product_addinfo" do
    put :update, :id => cs_product_addinfos(:one).to_param, :cs_product_addinfo => { }
    assert_redirected_to cs_product_addinfo_path(assigns(:cs_product_addinfo))
  end

  test "should destroy cs_product_addinfo" do
    assert_difference('CsProductAddinfo.count', -1) do
      delete :destroy, :id => cs_product_addinfos(:one).to_param
    end

    assert_redirected_to cs_product_addinfos_path
  end
end
