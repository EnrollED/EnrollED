require 'test_helper'

class ModeOfStudiesControllerTest < ActionController::TestCase
  setup do
    @mode_of_study = mode_of_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mode_of_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mode_of_study" do
    assert_difference('ModeOfStudy.count') do
      post :create, mode_of_study: { code: @mode_of_study.code, isValid: @mode_of_study.isValid, name: @mode_of_study.name }
    end

    assert_redirected_to mode_of_study_path(assigns(:mode_of_study))
  end

  test "should show mode_of_study" do
    get :show, id: @mode_of_study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mode_of_study
    assert_response :success
  end

  test "should update mode_of_study" do
    patch :update, id: @mode_of_study, mode_of_study: { code: @mode_of_study.code, isValid: @mode_of_study.isValid, name: @mode_of_study.name }
    assert_redirected_to mode_of_study_path(assigns(:mode_of_study))
  end

  test "should destroy mode_of_study" do
    assert_difference('ModeOfStudy.count', -1) do
      delete :destroy, id: @mode_of_study
    end

    assert_redirected_to mode_of_studies_path
  end
end
