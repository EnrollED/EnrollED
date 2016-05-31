class CandidatesController < ApplicationController
  layout 'home'

  def index
    @candidates = Application.includes(:user).page(params[:page]).per(10)

    @available_faculties = HigherEducationInstitution.includes(:university)
                               .order('universities.name, higher_education_institutions.name')

    @study_programs = StudyProgram.order(:name)

    @type_of_studies = TypeOfStudy.order(:name)

    @mode_of_studies = ModeOfStudy.order(:name)


    @application_choices = ApplicationChoice.all
  end

  def pdf_export
    @candidates = Application.includes(:user).page(params[:page]).per(10)
    @application_choices = ApplicationChoice.all

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