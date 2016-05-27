class StudyProgramsController < ApplicationController
  before_action :set_study_program, only: [:show, :edit, :update, :destroy]

  layout 'home'

  # GET /study_programs
  # GET /study_programs.json
  def index
    authorize StudyProgram

    @available_faculties = HigherEducationInstitution.includes(:university)
                               .order('universities.name, higher_education_institutions.name')

    @type_of_studies = TypeOfStudy.order(:name)

    @mode_of_studies = ModeOfStudy.order(:name)

    @extra_columns = [[ 'EU', :number_of_places, 'n_places'], [ 'Tujci', :number_of_places_foreign, 'n_places_foreign'],
                      ['EU sklep', :number_of_places_after_selection, 'n_selection'],
                      ['Tujci sklep', :number_of_places_after_selection_foreign, 'n_selection_foreign'],
                      ['EU sprejeti', :selected, 'n_selected'], ['Tujci sprejeti', :selected_foreign, 'n_selected_foreign']]

    @study_programs = StudyProgram
                          .advanced_search(params[:faculty_id], params[:type_of_study_id], params[:mode_of_study_id])
                          .includes({higher_education_institution: [:university]}, :type_of_study, :study_program_modes)
                          .order("higher_education_institutions.name, study_programs.name, type_of_studies.name")
                          .page(params[:page])
  end

  # GET /study_programs/1
  # GET /study_programs/1.json
  def show
    authorize StudyProgram
  end

  # GET /study_programs/new
  def new
    authorize StudyProgram
    @study_program = StudyProgram.new
  end

  # GET /study_programs/1/edit
  def edit
    authorize StudyProgram
  end

  # POST /study_programs
  # POST /study_programs.json
  def create
    authorize StudyProgram
    @study_program = StudyProgram.new(study_program_params)

    respond_to do |format|
      if @study_program.save
        format.html { redirect_to @study_program, notice: 'Študijski program uspešno dodan.' }
        format.json { render :show, status: :created, location: @study_program }
      else
        format.html { render :new }
        format.json { render json: @study_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_programs/1
  # PATCH/PUT /study_programs/1.json
  def update
    authorize StudyProgram
    respond_to do |format|
      if @study_program.update(study_program_params)
        format.html { redirect_to @study_program, notice: 'Študijski program uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @study_program }
      else
        format.html { render :edit }
        format.json { render json: @study_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_programs/1
  # DELETE /study_programs/1.json
  def destroy
    authorize StudyProgram
    @study_program.destroy
    respond_to do |format|
      format.html { redirect_to study_programs_url, notice: 'Študijski program označen kot neveljaven.' }
      format.json { head :no_content }
    end
  end

  def pdf_export
    @study_program = StudyProgram.find(params[:id])
    @requirements =   @study_program.requirements.order(:highschool_completion_id)
    @study_program_modes = @study_program.study_program_modes

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'study_programs/pdf_export.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf,
                  :filename    => "prijava_"+ (@study_program.name) +".pdf",
                  :disposition => 'attachment')
      end
    end
  end

  def pdf_export_list
    @extra_columns = [[ 'EU', :number_of_places, 'n_places'], [ 'Tujci', :number_of_places_foreign, 'n_places_foreign'],
                      ['EU sklep', :number_of_places_after_selection, 'n_selection'],
                      ['Tujci sklep', :number_of_places_after_selection_foreign, 'n_selection_foreign'],
                      ['EU sprejeti', :selected, 'n_selected'], ['Tujci sprejeti', :selected_foreign, 'n_selected_foreign']]

    @selected_columns = [ 'n_places', 'n_places_foreign', 'n_selection', 'n_selection_foreign', 'n_selected_foreign']

    @study_programs = StudyProgram
                          .advanced_search(params[:faculty_id], params[:type_of_study_id], params[:mode_of_study_id])
                          .includes({higher_education_institution: [:university]}, :type_of_study, :study_program_modes)
                          .order("higher_education_institutions.name, study_programs.name, type_of_studies.name")
                          .page(params[:page])

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'study_programs/pdf_export_list.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html, :orientation => 'Landscape')
        send_data(pdf,
                  :filename    => "programi.pdf",
                  :disposition => 'attachment')
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_program
      @study_program = StudyProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_program_params
      params.require(:study_program).permit(:name, :type_of_study_id, :higher_education_institution_id, :code, :enrollment_id)
    end
end
