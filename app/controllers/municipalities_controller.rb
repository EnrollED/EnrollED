class MunicipalitiesController < ApplicationController
  before_action :set_municipality, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /municipalities
  # GET /municipalities.json
  def index
    authorize Municipality
    @municipalities = Municipality.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /municipalities/1
  # GET /municipalities/1.json
  def show
    authorize Municipality
  end

  # GET /municipalities/new
  def new
    authorize Municipality
    @municipality = Municipality.new
  end

  # GET /municipalities/1/edit
  def edit
    authorize Municipality
  end

  # POST /municipalities
  # POST /municipalities.json
  def create
    authorize Municipality
    @municipality = Municipality.new(municipality_params)

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to @municipality, notice: 'Občina uspešno dodana.' }
        format.json { render :show, status: :created, location: @municipality }
      else
        format.html { render :new }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /municipalities/1
  # PATCH/PUT /municipalities/1.json
  def update
    authorize Municipality
    respond_to do |format|
      if @municipality.update(municipality_params)
        format.html { redirect_to @municipality, notice: 'Občina uspešno posodobljena.' }
        format.json { render :show, status: :ok, location: @municipality }
      else
        format.html { render :edit }
        format.json { render json: @municipality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /municipalities/1
  # DELETE /municipalities/1.json
  def destroy
    authorize Municipality
    @municipality.is_valid=false;

    respond_to do |format|
      if @municipality.save
        format.html { redirect_to municipalities_url, notice: 'Občina je bila označena kot neveljavna.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_municipality
      @municipality = Municipality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def municipality_params
      params.require(:municipality).permit(:code, :name, :is_valid)
    end
end
