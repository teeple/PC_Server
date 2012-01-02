require 'test_helper'

class WhereCustomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_custom" do
    assert_difference('WhereCustom.count') do
      post :create, :where_custom => { }
    end

    assert_redirected_to where_custom_path(assigns(:where_custom))
  end

  test "should show where_custom" do
    get :show, :id => where_customs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_customs(:one).to_param
    assert_response :success
  end

  test "should update where_custom" do
    put :update, :id => where_customs(:one).to_param, :where_custom => { }
    assert_redirected_to where_custom_path(assigns(:where_custom))
  end

  test "should destroy where_custom" do
    assert_difference('WhereCustom.count', -1) do
      delete :destroy, :id => where_customs(:one).to_param
    end

    assert_redirected_to where_customs_path
  end
end
