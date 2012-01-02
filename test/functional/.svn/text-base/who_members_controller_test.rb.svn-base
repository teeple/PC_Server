require 'test_helper'

class WhoMembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:who_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create who_member" do
    assert_difference('WhoMember.count') do
      post :create, :who_member => { }
    end

    assert_redirected_to who_member_path(assigns(:who_member))
  end

  test "should show who_member" do
    get :show, :id => who_members(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => who_members(:one).to_param
    assert_response :success
  end

  test "should update who_member" do
    put :update, :id => who_members(:one).to_param, :who_member => { }
    assert_redirected_to who_member_path(assigns(:who_member))
  end

  test "should destroy who_member" do
    assert_difference('WhoMember.count', -1) do
      delete :destroy, :id => who_members(:one).to_param
    end

    assert_redirected_to who_members_path
  end
end
