require 'test_helper'

class WhereCountryFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_country_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_country_factor" do
    assert_difference('WhereCountryFactor.count') do
      post :create, :where_country_factor => { }
    end

    assert_redirected_to where_country_factor_path(assigns(:where_country_factor))
  end

  test "should show where_country_factor" do
    get :show, :id => where_country_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_country_factors(:one).to_param
    assert_response :success
  end

  test "should update where_country_factor" do
    put :update, :id => where_country_factors(:one).to_param, :where_country_factor => { }
    assert_redirected_to where_country_factor_path(assigns(:where_country_factor))
  end

  test "should destroy where_country_factor" do
    assert_difference('WhereCountryFactor.count', -1) do
      delete :destroy, :id => where_country_factors(:one).to_param
    end

    assert_redirected_to where_country_factors_path
  end
end
