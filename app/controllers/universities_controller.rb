class UniversitiesController < ApplicationController
  before_action :set_university, only: [:show, :edit, :update, :destroy]

  # GET /universities
  # GET /universities.json
  def index
    authorize University
    @universities = University.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /universities/1
  # GET /universities/1.json
  def show
    authorize University
  end

  # GET /universities/new
  def new
    authorize University
    @university = University.new
  end

  # GET /universities/1/edit
  def edit
    authorize University
  end

  # POST /universities
  # POST /universities.json
  def create
    authorize University
    @university = University.new(university_params)

    respond_to do |format|
      if @university.save
        format.html { redirect_to @university, notice: 'Univerza uspešno dodana.' }
        format.json { render :show, status: :created, location: @university }
      else
        format.html { render :new }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universities/1
  # PATCH/PUT /universities/1.json
  def update
    authorize University
    respond_to do |format|
      if @university.update(university_params)
        format.html { redirect_to @university, notice: 'Univerza uspešno posodobljena.' }
        format.json { render :show, status: :ok, location: @university }
      else
        format.html { render :edit }
        format.json { render json: @university.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universities/1
  # DELETE /universities/1.json
  def destroy
    authorize University
    @university.is_valid=false
    respond_to do |format|
      if @university.save
        format.html { redirect_to universities_url, notice: 'Univerza je bila označena kot neveljavna.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_university
      @university = University.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def university_params
      params.require(:university).permit(:code, :name, :is_valid)
    end
end
