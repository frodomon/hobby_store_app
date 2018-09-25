class DoiTypesController < ApplicationController
  before_action :set_doi_type, only: [:show, :edit, :update, :destroy]

  # GET /doi_types
  # GET /doi_types.json
  def index
    @doi_types = DoiType.all
  end

  # GET /doi_types/1
  # GET /doi_types/1.json
  def show
  end

  # GET /doi_types/new
  def new
    @doi_type = DoiType.new
  end

  # GET /doi_types/1/edit
  def edit
  end

  # POST /doi_types
  # POST /doi_types.json
  def create
    @doi_type = DoiType.new(doi_type_params)

    respond_to do |format|
      if @doi_type.save
        format.html { redirect_to @doi_type, notice: 'Doi type was successfully created.' }
        format.json { render :show, status: :created, location: @doi_type }
      else
        format.html { render :new }
        format.json { render json: @doi_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doi_types/1
  # PATCH/PUT /doi_types/1.json
  def update
    respond_to do |format|
      if @doi_type.update(doi_type_params)
        format.html { redirect_to @doi_type, notice: 'Doi type was successfully updated.' }
        format.json { render :show, status: :ok, location: @doi_type }
      else
        format.html { render :edit }
        format.json { render json: @doi_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doi_types/1
  # DELETE /doi_types/1.json
  def destroy
    @doi_type.destroy
    respond_to do |format|
      format.html { redirect_to doi_types_url, notice: 'Doi type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doi_type
      @doi_type = DoiType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doi_type_params
      params.require(:doi_type).permit(:name, :short_name)
    end
end
