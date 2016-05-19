class ModeOfStudiesController < ApplicationController
  before_action :set_mode_of_study, only: [:show, :edit, :update, :destroy]

  # GET /mode_of_studies
  # GET /mode_of_studies.json
  def index
    @mode_of_studies = ModeOfStudy.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /mode_of_studies/1
  # GET /mode_of_studies/1.json
  def show
  end

  # GET /mode_of_studies/new
  def new
    @mode_of_study = ModeOfStudy.new
  end

  # GET /mode_of_studies/1/edit
  def edit
  end

  # POST /mode_of_studies
  # POST /mode_of_studies.json
  def create
    @mode_of_study = ModeOfStudy.new(mode_of_study_params)

    respond_to do |format|
      if @mode_of_study.save
        format.html { redirect_to @mode_of_study, notice: 'Način študija je bil uspešno dodan.' }
        format.json { render :show, status: :created, location: @mode_of_study }
      else
        format.html { render :new }
        format.json { render json: @mode_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mode_of_studies/1
  # PATCH/PUT /mode_of_studies/1.json
  def update
    respond_to do |format|
      if @mode_of_study.update(mode_of_study_params)
        format.html { redirect_to @mode_of_study, notice: 'Način študija je bil uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @mode_of_study }
      else
        format.html { render :edit }
        format.json { render json: @mode_of_study.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mode_of_studies/1
  # DELETE /mode_of_studies/1.json
  def destroy
    @mode_of_study.is_valid=false
    respond_to do |format|
      if @mode_of_study.save
        format.html { redirect_to mode_of_studies_url, notice: 'Način študija je bil označen kot neveljaven.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mode_of_study
      @mode_of_study = ModeOfStudy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mode_of_study_params
      params.require(:mode_of_study).permit(:code, :name, :is_valid)
    end
end
