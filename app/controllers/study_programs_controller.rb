class StudyProgramsController < ApplicationController
  before_action :set_study_program, only: [:show, :edit, :update, :destroy]

  # GET /study_programs
  # GET /study_programs.json
  def index
    authorize StudyProgram
    #@study_programs = StudyProgram.order(:higher_education_institution_id, :name).page(params[:page]).per(10)
    @study_programs = StudyProgram.joins(:higher_education_institution).order("higher_education_institutions.name, name").page(params[:page]).per(10)
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
        format.html { redirect_to @study_program, notice: 'Study program was successfully created.' }
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
        format.html { redirect_to @study_program, notice: 'Study program was successfully updated.' }
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
      format.html { redirect_to study_programs_url, notice: 'Study program was successfully destroyed.' }
      format.json { head :no_content }
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
