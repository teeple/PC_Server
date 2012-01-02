require 'test_helper'

class WhereCountriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:where_countries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create where_country" do
    assert_difference('WhereCountry.count') do
      post :create, :where_country => { }
    end

    assert_redirected_to where_country_path(assigns(:where_country))
  end

  test "should show where_country" do
    get :show, :id => where_countries(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => where_countries(:one).to_param
    assert_response :success
  end

  test "should update where_country" do
    put :update, :id => where_countries(:one).to_param, :where_country => { }
    assert_redirected_to where_country_path(assigns(:where_country))
  end

  test "should destroy where_country" do
    assert_difference('WhereCountry.count', -1) do
      delete :destroy, :id => where_countries(:one).to_param
    end

    assert_redirected_to where_countries_path
  end
end
