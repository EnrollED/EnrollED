class TypeOfStudiesController < ApplicationController
  before_action :set_type_of_study, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /type_of_studies
  # GET /type_of_studies.json
  def index
    authorize TypeOfStudy
    @type_of_studies = TypeOfStudy.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /type_of_studies/1
  # GET /type_of_studies/1.json
  def show
    authorize @type_of_study
  end

  # GET /type_of_studies/new
  def new
    @type_of_study = TypeOfStudy.new

    authorize @type_of_study
  end

  # GET /type_of_studies/1/edit
  def edit
    authorize TypeOfStudy
  end

  # POST /type_of_studies
  # POST /type_of_studies.json
  def create
    @type_of_study = TypeOfStudy.new(type_of_study_params)

    authorize @type_of_study

    respond_to do |format|
      if @type_of_study.save
        format.html { redirect_to @type_of_study, notice: 'Type of study was successfully created.' }
        format.json { render :show, status: :created, location: @type_of_study }
      else
        format.html { render :new }
        format.json { render json: @type_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_studies/1
  # PATCH/PUT /type_of_studies/1.json
  def update
    authorize @type_of_study

    respond_to do |format|
      if @type_of_study.update(type_of_study_params)
        format.html { redirect_to @type_of_study, notice: 'Type of study was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_of_study }
      else
        format.html { render :edit }
        format.json { render json: @type_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_studies/1
  # DELETE /type_of_studies/1.json
  def destroy
    authorize @type_of_study

    @type_of_study.is_valid=false
    respond_to do |format|
      if @type_of_study
        format.html { redirect_to type_of_studies_url, notice: 'Type of study was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_study
      @type_of_study = TypeOfStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_of_study_params
      params.require(:type_of_study).permit(:code, :name, :is_valid)
    end
end
