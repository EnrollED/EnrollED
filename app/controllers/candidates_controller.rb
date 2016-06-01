class CandidatesController < ApplicationController
  layout 'home'

  def index

    authorize ApplicationChoice
   # @candidates = CandidatePolicy::Scope.new(current_user, ApplicationChoice).resolve.page(params[:page])

    @candidates = ApplicationChoice.advanced_search(params[:faculty_id], params[:study_program_id], params[:type_of_study_id], params[:mode_of_study_id])
                      .includes([{study_program_mode: [{study_program: [:higher_education_institution]}, :mode_of_study]}, :application])
                      .page(params[:page])

    @available_faculties = HigherEducationInstitution.includes(:university)
                               .order('universities.name, higher_education_institutions.name')

    @study_programs = StudyProgram.order(:name)

    @type_of_studies = TypeOfStudy.order(:name)

    @mode_of_studies = ModeOfStudy.order(:name)
  end

  def pdf_export
    authorize ApplicationChoice
    @candidates = CandidatePolicy::Scope.new(current_user, ApplicationChoice).resolve

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

end