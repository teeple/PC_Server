require 'test_helper'

class RelationSubsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relation_subs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relation_sub" do
    assert_difference('RelationSub.count') do
      post :create, :relation_sub => { }
    end

    assert_redirected_to relation_sub_path(assigns(:relation_sub))
  end

  test "should show relation_sub" do
    get :show, :id => relation_subs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => relation_subs(:one).to_param
    assert_response :success
  end

  test "should update relation_sub" do
    put :update, :id => relation_subs(:one).to_param, :relation_sub => { }
    assert_redirected_to relation_sub_path(assigns(:relation_sub))
  end

  test "should destroy relation_sub" do
    assert_difference('RelationSub.count', -1) do
      delete :destroy, :id => relation_subs(:one).to_param
    end

    assert_redirected_to relation_subs_path
  end
end
