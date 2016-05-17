require 'test_helper'

class HighschoolCompletionsControllerTest < ActionController::TestCase
  setup do
    @highschool_completion = highschool_completions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highschool_completions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highschool_completion" do
    assert_difference('HighschoolCompletion.count') do
      post :create, highschool_completion: { code: @highschool_completion.code, is_valid: @highschool_completion.is_valid, name: @highschool_completion.name }
    end

    assert_redirected_to highschool_completion_path(assigns(:highschool_completion))
  end

  test "should show highschool_completion" do
    get :show, id: @highschool_completion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @highschool_completion
    assert_response :success
  end

  test "should update highschool_completion" do
    patch :update, id: @highschool_completion, highschool_completion: { code: @highschool_completion.code, is_valid: @highschool_completion.is_valid, name: @highschool_completion.name }
    assert_redirected_to highschool_completion_path(assigns(:highschool_completion))
  end

  test "should destroy highschool_completion" do
    assert_difference('HighschoolCompletion.count', -1) do
      delete :destroy, id: @highschool_completion
    end

    assert_redirected_to highschool_completions_path
  end
end
