require 'test_helper'

class HigherEducationInstitutionsControllerTest < ActionController::TestCase
  setup do
    @higher_education_institution = higher_education_institutions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:higher_education_institutions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create higher_education_institution" do
    assert_difference('HigherEducationInstitution.count') do
      post :create, higher_education_institution: { acronym: @higher_education_institution.acronym, code: @higher_education_institution.code, municipality: @higher_education_institution.municipality, name: @higher_education_institution.name, university: @higher_education_institution.university }
    end

    assert_redirected_to higher_education_institution_path(assigns(:higher_education_institution))
  end

  test "should show higher_education_institution" do
    get :show, id: @higher_education_institution
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @higher_education_institution
    assert_response :success
  end

  test "should update higher_education_institution" do
    patch :update, id: @higher_education_institution, higher_education_institution: { acronym: @higher_education_institution.acronym, code: @higher_education_institution.code, municipality: @higher_education_institution.municipality, name: @higher_education_institution.name, university: @higher_education_institution.university }
    assert_redirected_to higher_education_institution_path(assigns(:higher_education_institution))
  end

  test "should destroy higher_education_institution" do
    assert_difference('HigherEducationInstitution.count', -1) do
      delete :destroy, id: @higher_education_institution
    end

    assert_redirected_to higher_education_institutions_path
  end
end
