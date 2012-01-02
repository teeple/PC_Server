require 'test_helper'

class CodeFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:code_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create code_factor" do
    assert_difference('CodeFactor.count') do
      post :create, :code_factor => { }
    end

    assert_redirected_to code_factor_path(assigns(:code_factor))
  end

  test "should show code_factor" do
    get :show, :id => code_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => code_factors(:one).to_param
    assert_response :success
  end

  test "should update code_factor" do
    put :update, :id => code_factors(:one).to_param, :code_factor => { }
    assert_redirected_to code_factor_path(assigns(:code_factor))
  end

  test "should destroy code_factor" do
    assert_difference('CodeFactor.count', -1) do
      delete :destroy, :id => code_factors(:one).to_param
    end

    assert_redirected_to code_factors_path
  end
end
