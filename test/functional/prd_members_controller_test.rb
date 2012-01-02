require 'test_helper'

class PrdMembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prd_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prd_member" do
    assert_difference('PrdMember.count') do
      post :create, :prd_member => { }
    end

    assert_redirected_to prd_member_path(assigns(:prd_member))
  end

  test "should show prd_member" do
    get :show, :id => prd_members(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => prd_members(:one).to_param
    assert_response :success
  end

  test "should update prd_member" do
    put :update, :id => prd_members(:one).to_param, :prd_member => { }
    assert_redirected_to prd_member_path(assigns(:prd_member))
  end

  test "should destroy prd_member" do
    assert_difference('PrdMember.count', -1) do
      delete :destroy, :id => prd_members(:one).to_param
    end

    assert_redirected_to prd_members_path
  end
end
