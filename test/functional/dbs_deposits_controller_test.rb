require 'test_helper'

class DbsDepositsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dbs_deposits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dbs_deposit" do
    assert_difference('DbsDeposit.count') do
      post :create, :dbs_deposit => { }
    end

    assert_redirected_to dbs_deposit_path(assigns(:dbs_deposit))
  end

  test "should show dbs_deposit" do
    get :show, :id => dbs_deposits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => dbs_deposits(:one).to_param
    assert_response :success
  end

  test "should update dbs_deposit" do
    put :update, :id => dbs_deposits(:one).to_param, :dbs_deposit => { }
    assert_redirected_to dbs_deposit_path(assigns(:dbs_deposit))
  end

  test "should destroy dbs_deposit" do
    assert_difference('DbsDeposit.count', -1) do
      delete :destroy, :id => dbs_deposits(:one).to_param
    end

    assert_redirected_to dbs_deposits_path
  end
end
