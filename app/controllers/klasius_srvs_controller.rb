class KlasiusSrvsController < ApplicationController
  before_action :set_klasius_srv, only: [:show, :edit, :update, :destroy]

  # GET /klasius_srvs
  # GET /klasius_srvs.json
  def index
    authorize KlasiusSrv
    @klasius_srvs = KlasiusSrv.order(:code).search(params[:search]).page(params[:page])
  end

  # GET /klasius_srvs/1
  # GET /klasius_srvs/1.json
  def show
    authorize KlasiusSrv
  end

  # GET /klasius_srvs/new
  def new
    authorize KlasiusSrv
    @klasius_srv = KlasiusSrv.new
  end

  # GET /klasius_srvs/1/edit
  def edit
    authorize KlasiusSrv
  end

  # POST /klasius_srvs
  # POST /klasius_srvs.json
  def create
    authorize KlasiusSrv
    @klasius_srv = KlasiusSrv.new(klasius_srv_params)

    respond_to do |format|
      if @klasius_srv.save
        format.html { redirect_to @klasius_srv, notice: 'Nov zapis uspešno dodan.' }
        format.json { render :show, status: :created, location: @klasius_srv }
      else
        format.html { render :new }
        format.json { render json: @klasius_srv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /klasius_srvs/1
  # PATCH/PUT /klasius_srvs/1.json
  def update
    authorize KlasiusSrv
    respond_to do |format|
      if @klasius_srv.update(klasius_srv_params)
        format.html { redirect_to @klasius_srv, notice: 'Zapis uspešno posodobljen' }
        format.json { render :show, status: :ok, location: @klasius_srv }
      else
        format.html { render :edit }
        format.json { render json: @klasius_srv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /klasius_srvs/1
  # DELETE /klasius_srvs/1.json
  def destroy
    authorize KlasiusSrv
    @klasius_srv.is_valid=false
    respond_to do |format|
      if @klasius_srv.save
        format.html { redirect_to klasius_srvs_url, notice: 'Zapis označen kot neveljaven.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_klasius_srv
      @klasius_srv = KlasiusSrv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def klasius_srv_params
      params.require(:klasius_srv).permit(:id, :code, :description__sl, :description_en, :parent, :level, :is_valid)
    end
end
