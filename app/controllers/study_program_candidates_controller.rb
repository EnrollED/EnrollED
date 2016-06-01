class StudyProgramCandidatesController < ApplicationController
  before_action :set_study_program, only: [:index]

  layout 'home'

  def index

    #authorize ApplicationChoice

    @candidates = ApplicationChoice.advanced_search(nil, nil, nil, params[:mode_of_study_id])
                      .where({study_program_modes: {study_program_id: @study_program.id}})
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution]}, :mode_of_study]}, :application])
                      .page(params[:page])

    @mode_of_studies = ModeOfStudy.order(:name)

  end

  private
  def set_study_program
    @study_program = StudyProgram.find(params[:study_program_id])
  end
end
