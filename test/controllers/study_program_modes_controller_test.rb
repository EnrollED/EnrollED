require 'test_helper'

class StudyProgramModesControllerTest < ActionController::TestCase
  setup do
    @study_program_mode = study_program_modes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_program_modes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_program_mode" do
    assert_difference('StudyProgramMode.count') do
      post :create, study_program_mode: {  }
    end

    assert_redirected_to study_program_mode_path(assigns(:study_program_mode))
  end

  test "should show study_program_mode" do
    get :show, id: @study_program_mode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @study_program_mode
    assert_response :success
  end

  test "should update study_program_mode" do
    patch :update, id: @study_program_mode, study_program_mode: {  }
    assert_redirected_to study_program_mode_path(assigns(:study_program_mode))
  end

  test "should destroy study_program_mode" do
    assert_difference('StudyProgramMode.count', -1) do
      delete :destroy, id: @study_program_mode
    end

    assert_redirected_to study_program_modes_path
  end
end
