require 'test_helper'

class CsProductConditionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cs_product_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cs_product_condition" do
    assert_difference('CsProductCondition.count') do
      post :create, :cs_product_condition => { }
    end

    assert_redirected_to cs_product_condition_path(assigns(:cs_product_condition))
  end

  test "should show cs_product_condition" do
    get :show, :id => cs_product_conditions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => cs_product_conditions(:one).to_param
    assert_response :success
  end

  test "should update cs_product_condition" do
    put :update, :id => cs_product_conditions(:one).to_param, :cs_product_condition => { }
    assert_redirected_to cs_product_condition_path(assigns(:cs_product_condition))
  end

  test "should destroy cs_product_condition" do
    assert_difference('CsProductCondition.count', -1) do
      delete :destroy, :id => cs_product_conditions(:one).to_param
    end

    assert_redirected_to cs_product_conditions_path
  end
end
