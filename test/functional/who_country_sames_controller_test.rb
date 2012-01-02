require 'test_helper'

class WhoCountrySamesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_country_sames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_country_same" do
    assert_difference('WhoCountrySame.count') do
      post :create, :who_country_same => { }
    end

    assert_redirected_to who_country_same_path(assigns(:who_country_same))
  end

  test "should show who_country_same" do
    get :show, :id => who_country_sames(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_country_sames(:one).to_param
    assert_response :success
  end

  test "should update who_country_same" do
    put :update, :id => who_country_sames(:one).to_param, :who_country_same => { }
    assert_redirected_to who_country_same_path(assigns(:who_country_same))
  end

  test "should destroy who_country_same" do
    assert_difference('WhoCountrySame.count', -1) do
      delete :destroy, :id => who_country_sames(:one).to_param
    end

    assert_redirected_to who_country_sames_path
  end
end
