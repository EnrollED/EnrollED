class StudyProgramCandidatesController < ApplicationController
  before_action :set_study_program, only: [:index, :pdf_export]

  layout 'home'

  def index

    #authorize ApplicationChoice

    @candidates = ApplicationChoice.advanced_search(nil, nil, nil, params[:mode_of_study_id])
                      .where({study_program_modes: {study_program_id: @study_program.id}})
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution]}, :mode_of_study]}, {application: [:user]}])
                      .order('mode_of_studies.name DESC, users.lastname')
                      .page(params[:page])

    @mode_of_studies = ModeOfStudy.order(:name)

  end

  def pdf_export
    #authorize ApplicationChoice

    @candidates = ApplicationChoice.where({study_program_modes: {study_program_id: @study_program.id}})
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution]}, :mode_of_study]}, :application])

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'candidates/pdf_export.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html, :orientation => 'Landscape')
        send_data(pdf,
                  :filename    => "kandidati.pdf",
                  :disposition => 'attachment')
      end
    end
  end

  private
  def set_study_program
    @study_program = StudyProgram.find(params[:study_program_id])
  end
end
