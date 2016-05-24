class CitizensController < ApplicationController
  before_action :set_citizen, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /citizens
  # GET /citizens.json
  def index
    authorize Citizen
    @citizens = Citizen.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /citizens/1
  # GET /citizens/1.json
  def show
    authorize Citizen
  end

  # GET /citizens/new
  def new
    authorize Citizen
    @citizen = Citizen.new
  end

  # GET /citizens/1/edit
  def edit
    authorize Citizen
  end

  # POST /citizens
  # POST /citizens.json
  def create
    authorize Citizen
    @citizen = Citizen.new(citizen_params)

    respond_to do |format|
      if @citizen.save
        format.html { redirect_to @citizen, notice: 'Zapis uspešno dodan.' }
        format.json { render :show, status: :created, location: @citizen }
      else
        format.html { render :new }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citizens/1
  # PATCH/PUT /citizens/1.json
  def update
    authorize Citizen
    respond_to do |format|
      if @citizen.update(citizen_params)
        format.html { redirect_to @citizen, notice: 'Zapis uspešno posodobljen' }
        format.json { render :show, status: :ok, location: @citizen }
      else
        format.html { render :edit }
        format.json { render json: @citizen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citizens/1
  # DELETE /citizens/1.json
  def destroy
    authorize Citizen
    @citizen.is_valid=false
    respond_to do |format|
      if @citizen.save
        format.html { redirect_to citizens_url, notice: 'Zapis označen kot neveljaven.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citizen_params
      params.require(:citizen).permit(:code, :name, :is_valid)
    end
end
