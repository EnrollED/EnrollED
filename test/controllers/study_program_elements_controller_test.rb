require 'test_helper'

class StudyProgramElementsControllerTest < ActionController::TestCase
  setup do
    @study_program_element = study_program_elements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_program_elements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_program_element" do
    assert_difference('StudyProgramElement.count') do
      post :create, study_program_element: {  }
    end

    assert_redirected_to study_program_element_path(assigns(:study_program_element))
  end

  test "should show study_program_element" do
    get :show, id: @study_program_element
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_program_element
    assert_response :success
  end

  test "should update study_program_element" do
    patch :update, id: @study_program_element, study_program_element: {  }
    assert_redirected_to study_program_element_path(assigns(:study_program_element))
  end

  test "should destroy study_program_element" do
    assert_difference('StudyProgramElement.count', -1) do
      delete :destroy, id: @study_program_element
    end

    assert_redirected_to study_program_elements_path
  end
end
