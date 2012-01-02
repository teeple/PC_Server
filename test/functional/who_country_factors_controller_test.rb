require 'test_helper'

class WhoCountryFactorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_country_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_country_factor" do
    assert_difference('WhoCountryFactor.count') do
      post :create, :who_country_factor => { }
    end

    assert_redirected_to who_country_factor_path(assigns(:who_country_factor))
  end

  test "should show who_country_factor" do
    get :show, :id => who_country_factors(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_country_factors(:one).to_param
    assert_response :success
  end

  test "should update who_country_factor" do
    put :update, :id => who_country_factors(:one).to_param, :who_country_factor => { }
    assert_redirected_to who_country_factor_path(assigns(:who_country_factor))
  end

  test "should destroy who_country_factor" do
    assert_difference('WhoCountryFactor.count', -1) do
      delete :destroy, :id => who_country_factors(:one).to_param
    end

    assert_redirected_to who_country_factors_path
  end
end
