class ProfessionsController < ApplicationController
  before_action :set_profession, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /professions
  # GET /professions.json
  def index
    authorize Profession
    @professions = Profession.order(:name).search(params[:search]).page(params[:page])
  end

  # GET /professions/1
  # GET /professions/1.json
  def show
    authorize Profession
  end

  # GET /professions/new
  def new
    authorize Profession
    @profession = Profession.new
  end

  # GET /professions/1/edit
  def edit
    authorize Profession
  end

  # POST /professions
  # POST /professions.json
  def create
    authorize Profession
    @profession = Profession.new(profession_params)

    respond_to do |format|
      if @profession.save
        format.html { redirect_to @profession, notice: 'Poklic uspešno dodan.' }
        format.json { render :show, status: :created, location: @profession }
      else
        format.html { render :new }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professions/1
  # PATCH/PUT /professions/1.json
  def update
    authorize Profession
    respond_to do |format|
      if @profession.update(profession_params)
        format.html { redirect_to @profession, notice: 'Poklic uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @profession }
      else
        format.html { render :edit }
        format.json { render json: @profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professions/1
  # DELETE /professions/1.json
  def destroy
    authorize Profession
    @profession.is_valid=false
    respond_to do |format|
      if @profession.save
        format.html { redirect_to professions_url, notice: 'Poklic označen kot neveljaven.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession
      @profession = Profession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profession_params
      params.require(:profession).permit(:code, :name, :is_valid)
    end
end
