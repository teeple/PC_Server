require 'test_helper'

class WhenCustomsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:when_customs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create when_custom" do
    assert_difference('WhenCustom.count') do
      post :create, :when_custom => { }
    end

    assert_redirected_to when_custom_path(assigns(:when_custom))
  end

  test "should show when_custom" do
    get :show, :id => when_customs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => when_customs(:one).to_param
    assert_response :success
  end

  test "should update when_custom" do
    put :update, :id => when_customs(:one).to_param, :when_custom => { }
    assert_redirected_to when_custom_path(assigns(:when_custom))
  end

  test "should destroy when_custom" do
    assert_difference('WhenCustom.count', -1) do
      delete :destroy, :id => when_customs(:one).to_param
    end

    assert_redirected_to when_customs_path
  end
end
