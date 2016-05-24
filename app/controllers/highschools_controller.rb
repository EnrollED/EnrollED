class HighschoolsController < ApplicationController
  before_action :set_highschool, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /highschools
  # GET /highschools.json
  def index
    authorize Highschool
    @highschools = Highschool.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /highschools/1
  # GET /highschools/1.json
  def show
    authorize Highschool
  end

  # GET /highschools/new
  def new
    authorize Highschool
    @highschool = Highschool.new
  end

  # GET /highschools/1/edit
  def edit
    authorize Highschool
  end

  # POST /highschools
  # POST /highschools.json
  def create
    authorize Highschool
    @highschool = Highschool.new(highschool_params)

    respond_to do |format|
      if @highschool.save
        format.html { redirect_to @highschool, notice: 'Srednja šola uspešno dodana.' }
        format.json { render :show, status: :created, location: @highschool }
      else
        format.html { render :new }
        format.json { render json: @highschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highschools/1
  # PATCH/PUT /highschools/1.json
  def update
    authorize Highschool
    respond_to do |format|
      if @highschool.update(highschool_params)
        format.html { redirect_to @highschool, notice: 'Srednja šola uspešno posodobljena.' }
        format.json { render :show, status: :ok, location: @highschool }
      else
        format.html { render :edit }
        format.json { render json: @highschool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highschools/1
  # DELETE /highschools/1.json
  def destroy
    @highschool.is_valid=false
    respond_to do |format|
      if @highschool.save
        format.html { redirect_to highschools_url, notice: 'Srednja šola označena kot neveljavna.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highschool
      @highschool = Highschool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highschool_params
      params.require(:highschool).permit(:code, :name, :is_valid)
    end
end
