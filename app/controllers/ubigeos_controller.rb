class UbigeosController < ApplicationController
  before_action :set_ubigeo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show, :get_departamentos, :get_provincias, :get_distritos, :get_ubigeo ]
  load_and_authorize_resource

  # GET /ubigeos
  # GET /ubigeos.json
  def index
    @ubigeos = Ubigeo.all
  end

  # GET /ubigeos/1
  # GET /ubigeos/1.json
  def show
  end

  # GET /ubigeos/new
  def new
    @ubigeo = Ubigeo.new
  end

  # GET /ubigeos/1/edit
  def edit
  end

  # POST /ubigeos
  # POST /ubigeos.json
  def create
    @ubigeo = Ubigeo.new(ubigeo_params)

    respond_to do |format|
      if @ubigeo.save
        format.html { redirect_to @ubigeo, notice: 'Ubigeo was successfully created.' }
        format.json { render :show, status: :created, location: @ubigeo }
      else
        format.html { render :new }
        format.json { render json: @ubigeo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubigeos/1
  # PATCH/PUT /ubigeos/1.json
  def update
    respond_to do |format|
      if @ubigeo.update(ubigeo_params)
        format.html { redirect_to @ubigeo, notice: 'Ubigeo was successfully updated.' }
        format.json { render :show, status: :ok, location: @ubigeo }
      else
        format.html { render :edit }
        format.json { render json: @ubigeo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubigeos/1
  # DELETE /ubigeos/1.json
  def destroy
    @ubigeo.destroy
    respond_to do |format|
      format.html { redirect_to ubigeos_url, notice: 'Ubigeo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_departamentos
    @ubigeo = Ubigeo.find_by_sql ["select ug_id, name, parent_id from ubigeos where parent_id is null"]
    
    respond_to do |format|
        format.html
        format.json { render json: @ubigeo }
    end
  end
  def get_provincias
    @ws_ubigeo = Ubigeo.where(parent_id: params[:departamento])

    respond_to do |format|
        format.html
        format.json { render json: @ws_ubigeo }
    end
  end
  def get_distritos
    @ws_ubigeo = Ubigeo.where(parent_id: params[:provincia])

    respond_to do |format|
        format.html
        format.json { render json: @ws_ubigeo }
    end
  end
  def get_ubigeo
    @ubigeo = Ubigeo.find(params[:id])

    respond_to do |format|
        format.html
        format.json { render json: @ubigeo }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubigeo
      @ubigeo = Ubigeo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubigeo_params
      params.require(:ubigeo).permit(:ug_id, :name, :parent_id)
    end
end
