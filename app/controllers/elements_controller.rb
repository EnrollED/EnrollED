class ElementsController < ApplicationController
  before_action :set_element, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /elements
  # GET /elements.json
  def index
    authorize Element
    @elements = Element.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /elements/1
  # GET /elements/1.json
  def show
    authorize Element
  end

  # GET /elements/new
  def new
    authorize Element
    @element = Element.new
  end

  # GET /elements/1/edit
  def edit
    authorize Element
  end

  # POST /elements
  # POST /elements.json
  def create
    authorize Element
    @element = Element.new(element_params)

    respond_to do |format|
      if @element.save
        format.html { redirect_to @element, notice: 'Element je bil uspešno dodan.' }
        format.json { render :show, status: :created, location: @element }
      else
        format.html { render :new }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /elements/1
  # PATCH/PUT /elements/1.json
  def update
    authorize Element
    respond_to do |format|
      if @element.update(element_params)
        format.html { redirect_to @element, notice: 'Element je bil uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @element }
      else
        format.html { render :edit }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    authorize Element
    @element.is_valid=false;
    respond_to do |format|
      if @element.save
        format.html { redirect_to elements_url, notice: 'Element je bil označen kot neveljaven.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_element
      @element = Element.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def element_params
      params.require(:element).permit(:code, :name, :is_valid)
    end
end
