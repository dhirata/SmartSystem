require 'test_helper'

class SmartiesControllerTest < ActionController::TestCase
  setup do
    @smarty = smarties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smarties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smarty" do
    assert_difference('Smarty.count') do
      post :create, smarty: {  }
    end

    assert_redirected_to smarty_path(assigns(:smarty))
  end

  test "should show smarty" do
    get :show, id: @smarty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smarty
    assert_response :success
  end

  test "should update smarty" do
    patch :update, id: @smarty, smarty: {  }
    assert_redirected_to smarty_path(assigns(:smarty))
  end

  test "should destroy smarty" do
    assert_difference('Smarty.count', -1) do
      delete :destroy, id: @smarty
    end

    assert_redirected_to smarties_path
  end
end
