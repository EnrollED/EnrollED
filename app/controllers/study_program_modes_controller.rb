class StudyProgramModesController < ApplicationController
  before_action :set_study_program_mode, only: [:show, :edit, :update, :destroy]

  layout 'home'

  # GET /study_program_modes
  # GET /study_program_modes.json
  def index
    authorize StudyProgramMode
    #@study_program_modes = StudyProgramMode.all.page(params[:page]).per(10)
    @study_program_modes = StudyProgramMode.joins(:mode_of_study, :study_program, :study_program => :higher_education_institution).order("higher_education_institutions.name, study_programs.name").page(params[:page]).per(10)
  end

  # GET /study_program_modes/1
  # GET /study_program_modes/1.json
  def show
    authorize StudyProgramMode
  end

  # GET /study_program_modes/new
  def new
    authorize StudyProgramMode
    @study_program_mode = StudyProgramMode.new
  end

  # GET /study_program_modes/1/edit
  def edit
    authorize StudyProgramMode
  end

  # POST /study_program_modes
  # POST /study_program_modes.json
  def create
    authorize StudyProgramMode
    @study_program_mode = StudyProgramMode.new(study_program_mode_params)

    respond_to do |format|
      if @study_program_mode.save
        format.html { redirect_to @study_program_mode, notice: 'Razpisna mesta so bila uspešno dodana.' }
        format.json { render :show, status: :created, location: @study_program_mode }
      else
        format.html { render :new }
        format.json { render json: @study_program_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_program_modes/1
  # PATCH/PUT /study_program_modes/1.json
  def update
    authorize StudyProgramMode
    respond_to do |format|
      if @study_program_mode.update(study_program_mode_params)
        format.html { redirect_to @study_program_mode, notice: 'Razpisna mesta so bila uspešno posodobljena.' }
        format.json { render :show, status: :ok, location: @study_program_mode }
      else
        format.html { render :edit }
        format.json { render json: @study_program_mode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_program_modes/1
  # DELETE /study_program_modes/1.json
  def destroy
    authorize StudyProgramMode
    @study_program_mode.destroy
    respond_to do |format|
      format.html { redirect_to study_program_modes_url, notice: 'Razpisana mesta so bila uspešno pobrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_program_mode
      @study_program_mode = StudyProgramMode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_program_mode_params
      params.require(:study_program_mode).permit(:mode_of_study_id, :study_program_id, :number_of_places, :number_of_places_after_selection, :selection_limit, :number_of_places_foreign, :number_of_places_after_selection_foreign, :selected, :selected_foreign)
    end
end
