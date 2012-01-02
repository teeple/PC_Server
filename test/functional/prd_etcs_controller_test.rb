require 'test_helper'

class PrdEtcsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_etcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_etc" do
    assert_difference('PrdEtc.count') do
      post :create, :prd_etc => { }
    end

    assert_redirected_to prd_etc_path(assigns(:prd_etc))
  end

  test "should show prd_etc" do
    get :show, :id => prd_etcs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_etcs(:one).to_param
    assert_response :success
  end

  test "should update prd_etc" do
    put :update, :id => prd_etcs(:one).to_param, :prd_etc => { }
    assert_redirected_to prd_etc_path(assigns(:prd_etc))
  end

  test "should destroy prd_etc" do
    assert_difference('PrdEtc.count', -1) do
      delete :destroy, :id => prd_etcs(:one).to_param
    end

    assert_redirected_to prd_etcs_path
  end
end
