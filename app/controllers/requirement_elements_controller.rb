class RequirementElementsController < ApplicationController
  before_action :set_requirement_element, only: [:show, :edit, :update, :destroy]

  # GET /requirement_elements
  # GET /requirement_elements.json
  def index
    @requirement_elements = RequirementElement.all
  end

  # GET /requirement_elements/1
  # GET /requirement_elements/1.json
  def show
  end

  # GET /requirement_elements/new
  def new
    @requirement_element = RequirementElement.new
  end

  # GET /requirement_elements/1/edit
  def edit
  end

  # POST /requirement_elements
  # POST /requirement_elements.json
  def create
    @requirement_element = RequirementElement.new(requirement_element_params)

    respond_to do |format|
      if @requirement_element.save
        format.html { redirect_to @requirement_element, notice: 'Requirement element was successfully created.' }
        format.json { render :show, status: :created, location: @requirement_element }
      else
        format.html { render :new }
        format.json { render json: @requirement_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requirement_elements/1
  # PATCH/PUT /requirement_elements/1.json
  def update
    respond_to do |format|
      if @requirement_element.update(requirement_element_params)
        format.html { redirect_to @requirement_element, notice: 'Requirement element was successfully updated.' }
        format.json { render :show, status: :ok, location: @requirement_element }
      else
        format.html { render :edit }
        format.json { render json: @requirement_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requirement_elements/1
  # DELETE /requirement_elements/1.json
  def destroy
    @requirement_element.destroy
    respond_to do |format|
      format.html { redirect_to requirement_elements_url, notice: 'Requirement element was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requirement_element
      @requirement_element = RequirementElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requirement_element_params
      params.fetch(:requirement_element, {})
    end
end
