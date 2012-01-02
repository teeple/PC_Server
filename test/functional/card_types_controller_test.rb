require 'test_helper'

class CardTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_type" do
    assert_difference('CardType.count') do
      post :create, :card_type => { }
    end

    assert_redirected_to card_type_path(assigns(:card_type))
  end

  test "should show card_type" do
    get :show, :id => card_types(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => card_types(:one).to_param
    assert_response :success
  end

  test "should update card_type" do
    put :update, :id => card_types(:one).to_param, :card_type => { }
    assert_redirected_to card_type_path(assigns(:card_type))
  end

  test "should destroy card_type" do
    assert_difference('CardType.count', -1) do
      delete :destroy, :id => card_types(:one).to_param
    end

    assert_redirected_to card_types_path
  end
end
