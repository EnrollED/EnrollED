class RequirementElementsController < ApplicationController
  before_action :set_requirement_element, only: [:show, :edit, :update, :destroy]

  layout 'home'

  # GET /requirement_elements/new
  def new
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @requirement_element = RequirementElement.new
  end

  # POST /requirement_elements
  # POST /requirement_elements.json
  def create
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @requirement_element = RequirementElement.new(requirement_element_params)
    @requirement_element.requirement = @requirement
    if @requirement_element.save
      redirect_to study_program_requirements_path(@study_program), notice: 'Predmet uspešno dodan.'
    else
      render :new
    end
  end

  # DELETE /requirement_elements/1
  # DELETE /requirement_elements/1.json
  def destroy
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @requirement_element.destroy
    redirect_to study_program_requirements_path(@study_program), notice: 'Predmet uspešno odstranjen.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement_element
      @requirement_element = RequirementElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_element_params
      params.require(:requirement_element).permit(:element_id)
    end
end
