require 'test_helper'

class TypeOfStudiesControllerTest < ActionController::TestCase
  setup do
    @type_of_study = type_of_studies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_of_studies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_of_study" do
    assert_difference('TypeOfStudy.count') do
      post :create, type_of_study: { code: @type_of_study.code, is_valid: @type_of_study.is_valid, name: @type_of_study.name }
    end

    assert_redirected_to type_of_study_path(assigns(:type_of_study))
  end

  test "should show type_of_study" do
    get :show, id: @type_of_study
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_of_study
    assert_response :success
  end

  test "should update type_of_study" do
    patch :update, id: @type_of_study, type_of_study: { code: @type_of_study.code, is_valid: @type_of_study.is_valid, name: @type_of_study.name }
    assert_redirected_to type_of_study_path(assigns(:type_of_study))
  end

  test "should destroy type_of_study" do
    assert_difference('TypeOfStudy.count', -1) do
      delete :destroy, id: @type_of_study
    end

    assert_redirected_to type_of_studies_path
  end
end
