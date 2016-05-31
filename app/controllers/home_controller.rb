class HomeController < ApplicationController

  layout 'home'

  def index
    redirect_to application_forms_path
  end

  def my_programs
    authorize :study_program, :my?

    faculties = HigherEducationInstitution.with_role(:member, current_user).pluck(:id)

    puts faculties

    @study_programs = StudyProgram
                          .includes(:study_program_modes, {higher_education_institution: [:university]}, :type_of_study)
                          .where(higher_education_institution_id: faculties)
                          .order("higher_education_institutions.name, study_programs.name, type_of_studies.name")
                          .page(params[:page])
  end
end
