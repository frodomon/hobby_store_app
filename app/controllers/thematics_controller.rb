class ThematicsController < ApplicationController
  before_action :set_thematic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /thematics
  # GET /thematics.json
  def index
    @thematics = Thematic.all
  end

  # GET /thematics/1
  # GET /thematics/1.json
  def show
  end

  # GET /thematics/new
  def new
    @thematic = Thematic.new
  end

  # GET /thematics/1/edit
  def edit
  end

  # POST /thematics
  # POST /thematics.json
  def create
    @thematic = Thematic.new(thematic_params)

    respond_to do |format|
      if @thematic.save
        format.html { redirect_to @thematic, notice: 'Thematic was successfully created.' }
        format.json { render :show, status: :created, location: @thematic }
      else
        format.html { render :new }
        format.json { render json: @thematic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thematics/1
  # PATCH/PUT /thematics/1.json
  def update
    respond_to do |format|
      if @thematic.update(thematic_params)
        format.html { redirect_to @thematic, notice: 'Thematic was successfully updated.' }
        format.json { render :show, status: :ok, location: @thematic }
      else
        format.html { render :edit }
        format.json { render json: @thematic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thematics/1
  # DELETE /thematics/1.json
  def destroy
    @thematic.destroy
    respond_to do |format|
      format.html { redirect_to thematics_url, notice: 'Thematic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thematic
      @thematic = Thematic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thematic_params
      params.require(:thematic).permit(:name)
    end
end
