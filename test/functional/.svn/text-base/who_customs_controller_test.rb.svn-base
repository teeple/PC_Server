require 'test_helper'

class WhoCustomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_custom" do
    assert_difference('WhoCustom.count') do
      post :create, :who_custom => { }
    end

    assert_redirected_to who_custom_path(assigns(:who_custom))
  end

  test "should show who_custom" do
    get :show, :id => who_customs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_customs(:one).to_param
    assert_response :success
  end

  test "should update who_custom" do
    put :update, :id => who_customs(:one).to_param, :who_custom => { }
    assert_redirected_to who_custom_path(assigns(:who_custom))
  end

  test "should destroy who_custom" do
    assert_difference('WhoCustom.count', -1) do
      delete :destroy, :id => who_customs(:one).to_param
    end

    assert_redirected_to who_customs_path
  end
end
