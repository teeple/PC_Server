require 'test_helper'

class WhoCountriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_country" do
    assert_difference('WhoCountry.count') do
      post :create, :who_country => { }
    end

    assert_redirected_to who_country_path(assigns(:who_country))
  end

  test "should show who_country" do
    get :show, :id => who_countries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_countries(:one).to_param
    assert_response :success
  end

  test "should update who_country" do
    put :update, :id => who_countries(:one).to_param, :who_country => { }
    assert_redirected_to who_country_path(assigns(:who_country))
  end

  test "should destroy who_country" do
    assert_difference('WhoCountry.count', -1) do
      delete :destroy, :id => who_countries(:one).to_param
    end

    assert_redirected_to who_countries_path
  end
end
