class HighschoolCompletionsController < ApplicationController
  before_action :set_highschool_completion, only: [:show, :edit, :update, :destroy]

  # GET /highschool_completions
  # GET /highschool_completions.json
  def index
    authorize HighschoolCompletion
    @highschool_completions = HighschoolCompletion.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /highschool_completions/1
  # GET /highschool_completions/1.json
  def show
    authorize HighschoolCompletion
  end

  # GET /highschool_completions/new
  def new
    authorize HighschoolCompletion
    @highschool_completion = HighschoolCompletion.new
  end

  # GET /highschool_completions/1/edit
  def edit
    authorize HighschoolCompletion
  end

  # POST /highschool_completions
  # POST /highschool_completions.json
  def create
    authorize HighschoolCompletion
    @highschool_completion = HighschoolCompletion.new(highschool_completion_params)

    respond_to do |format|
      if @highschool_completion.save
        format.html { redirect_to @highschool_completion, notice: 'Zaključek srednje šole je bil uspešno dodan.' }
        format.json { render :show, status: :created, location: @highschool_completion }
      else
        format.html { render :new }
        format.json { render json: @highschool_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /highschool_completions/1
  # PATCH/PUT /highschool_completions/1.json
  def update
    authorize HighschoolCompletion
    respond_to do |format|
      if @highschool_completion.update(highschool_completion_params)
        format.html { redirect_to @highschool_completion, notice: 'Zaključek srednje šole je bil uspešno posodobljen.' }
        format.json { render :show, status: :ok, location: @highschool_completion }
      else
        format.html { render :edit }
        format.json { render json: @highschool_completion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /highschool_completions/1
  # DELETE /highschool_completions/1.json
  def destroy
    authorize HighschoolCompletion
    @highschool_completion.is_valid=false
    respond_to do |format|
     if @highschool_completion.save
        format.html { redirect_to highschool_completions_url, notice: 'Zapis je bil označen kot neveljaven.' }
        format.json { head :no_content }
     end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_highschool_completion
      @highschool_completion = HighschoolCompletion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def highschool_completion_params
      params.require(:highschool_completion).permit(:code, :name, :is_valid)
    end
end
