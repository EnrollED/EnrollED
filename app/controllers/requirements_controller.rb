class RequirementsController < ApplicationController
  before_action :set_requirement, only: [:show, :edit, :update, :destroy]

  layout 'home'

  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.where(:study_program_id => params[:study_program_id]).order(:highschool_completion_id)
    @study_program = StudyProgram.find(params[:study_program_id])
  end

  # GET /requirements/new
  def new
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.new
  end


  # POST /requirements
  # POST /requirements.json
  def create
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.new(requirement_params)
    @requirement.study_program = @study_program

    if @requirement.save
      redirect_to study_program_requirements_path(@study_program), notice: 'Pogoj uspešno dodan.'
    else
      render :new
    end
  end

  # PATCH/PUT /requirements/1
  # PATCH/PUT /requirements/1.json
  def update
    @study_program = StudyProgram.find(params[:study_program_id])
    if @requirement.update(requirement_params)
      redirect_to study_program_requirements_path(@study_program), notice: 'Pogoj uspešno posodobljen.'
    else
      render :edit
    end
  end

  # DELETE /requirements/1
  # DELETE /requirements/1.json
  def destroy
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement.destroy
    redirect_to study_program_requirements_path(@study_program)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_requirement
    @requirement = Requirement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def requirement_params
    params.require(:requirement).permit(:study_program_id, :highschool_completion_id, :profession_id)
  end
end
