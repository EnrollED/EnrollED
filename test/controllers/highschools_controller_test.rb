require 'test_helper'

class HighschoolsControllerTest < ActionController::TestCase
  setup do
    @highschool = highschools(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highschools)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highschool" do
    assert_difference('Highschool.count') do
      post :create, highschool: { code: @highschool.code, is_valid: @highschool.is_valid, name: @highschool.name }
    end

    assert_redirected_to highschool_path(assigns(:highschool))
  end

  test "should show highschool" do
    get :show, id: @highschool
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @highschool
    assert_response :success
  end

  test "should update highschool" do
    patch :update, id: @highschool, highschool: { code: @highschool.code, is_valid: @highschool.is_valid, name: @highschool.name }
    assert_redirected_to highschool_path(assigns(:highschool))
  end

  test "should destroy highschool" do
    assert_difference('Highschool.count', -1) do
      delete :destroy, id: @highschool
    end

    assert_redirected_to highschools_path
  end
end
