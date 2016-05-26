class StudyProgramElementsController < ApplicationController
  before_action :set_study_program_element, only: [:show, :edit, :update, :destroy]

  layout 'home'

  # GET /study_program_elements/new
  def new
    authorize StudyProgramElement
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @study_program_element = StudyProgramElement.new
  end

  # GET /study_program_elements/1/edit
  def edit
    authorize @study_program_element
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
  end

  # POST /study_program_elements
  # POST /study_program_elements.json
  def create
    authorize StudyProgramElement
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @study_program_element = StudyProgramElement.new(study_program_element_params)
    @study_program_element.requirement = @requirement

    if @study_program_element.save
      redirect_to study_program_requirements_path(@study_program), notice: 'Element uspešno dodan.'
    else
      render :new
    end
  end

  # PATCH/PUT /study_program_elements/1
  # PATCH/PUT /study_program_elements/1.json
  def update
    authorize @study_program_element
    respond_to do |format|
      if @study_program_element.update(study_program_element_params)
        format.html { redirect_to @study_program_element, notice: 'Study program element was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_program_element }
      else
        format.html { render :edit }
        format.json { render json: @study_program_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_program_elements/1
  # DELETE /study_program_elements/1.json
  def destroy
    authorize @study_program_element
    @study_program = StudyProgram.find(params[:study_program_id])
    @requirement = Requirement.find(params[:requirement_id])
    @study_program_element.destroy
    redirect_to study_program_requirements_path(@study_program), notice: 'Element uspešno odstranjen.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study_program_element
      @study_program_element = StudyProgramElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def study_program_element_params
      params.require(:study_program_element).permit(:element_id, :weight)
    end
end
