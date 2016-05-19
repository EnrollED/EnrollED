class HigherEducationInstitutionsController < ApplicationController
  before_action :set_higher_education_institution, only: [:show, :edit, :update, :destroy]

  # GET /higher_education_institutions
  # GET /higher_education_institutions.json
  def index
    @higher_education_institutions = HigherEducationInstitution.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /higher_education_institutions/1
  # GET /higher_education_institutions/1.json
  def show
  end

  # GET /higher_education_institutions/new
  def new
    @higher_education_institution = HigherEducationInstitution.new
  end

  # GET /higher_education_institutions/1/edit
  def edit
  end

  # POST /higher_education_institutions
  # POST /higher_education_institutions.json
  def create
    @higher_education_institution = HigherEducationInstitution.new(higher_education_institution_params)

    respond_to do |format|
      if @higher_education_institution.save
        format.html { redirect_to @higher_education_institution, notice: 'Visokošolski zavod uspešno dodan.' }
        format.json { render :show, status: :created, location: @higher_education_institution }
      else
        format.html { render :new }
        format.json { render json: @higher_education_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /higher_education_institutions/1
  # PATCH/PUT /higher_education_institutions/1.json
  def update
    respond_to do |format|
      if @higher_education_institution.update(higher_education_institution_params)
        format.html { redirect_to @higher_education_institution, notice: 'Visokošolski zavod uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @higher_education_institution }
      else
        format.html { render :edit }
        format.json { render json: @higher_education_institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /higher_education_institutions/1
  # DELETE /higher_education_institutions/1.json
  def destroy
    @higher_education_institution.is_valid=false
      respond_to do |format|
        if @higher_education_institution.save
          format.html { redirect_to higher_education_institutions_url, notice: 'Visokošolski zavod označen kot neveljaven.' }
          format.json { head :no_content }
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_higher_education_institution
      @higher_education_institution = HigherEducationInstitution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def higher_education_institution_params
      params.require(:higher_education_institution).permit(:code, :name, :acronym, :university_id)
    end
end
