require 'test_helper'

class WhoPrefixesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_prefixes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_prefix" do
    assert_difference('WhoPrefix.count') do
      post :create, :who_prefix => { }
    end

    assert_redirected_to who_prefix_path(assigns(:who_prefix))
  end

  test "should show who_prefix" do
    get :show, :id => who_prefixes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_prefixes(:one).to_param
    assert_response :success
  end

  test "should update who_prefix" do
    put :update, :id => who_prefixes(:one).to_param, :who_prefix => { }
    assert_redirected_to who_prefix_path(assigns(:who_prefix))
  end

  test "should destroy who_prefix" do
    assert_difference('WhoPrefix.count', -1) do
      delete :destroy, :id => who_prefixes(:one).to_param
    end

    assert_redirected_to who_prefixes_path
  end
end
