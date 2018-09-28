class SuggestedAgesController < ApplicationController
  before_action :set_suggested_age, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /suggested_ages
  # GET /suggested_ages.json
  def index
    @suggested_ages = SuggestedAge.all
  end

  # GET /suggested_ages/1
  # GET /suggested_ages/1.json
  def show
  end

  # GET /suggested_ages/new
  def new
    @suggested_age = SuggestedAge.new
  end

  # GET /suggested_ages/1/edit
  def edit
  end

  # POST /suggested_ages
  # POST /suggested_ages.json
  def create
    @suggested_age = SuggestedAge.new(suggested_age_params)

    respond_to do |format|
      if @suggested_age.save
        format.html { redirect_to @suggested_age, notice: 'Suggested age was successfully created.' }
        format.json { render :show, status: :created, location: @suggested_age }
      else
        format.html { render :new }
        format.json { render json: @suggested_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggested_ages/1
  # PATCH/PUT /suggested_ages/1.json
  def update
    respond_to do |format|
      if @suggested_age.update(suggested_age_params)
        format.html { redirect_to @suggested_age, notice: 'Suggested age was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggested_age }
      else
        format.html { render :edit }
        format.json { render json: @suggested_age.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggested_ages/1
  # DELETE /suggested_ages/1.json
  def destroy
    @suggested_age.destroy
    respond_to do |format|
      format.html { redirect_to suggested_ages_url, notice: 'Suggested age was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suggested_age
      @suggested_age = SuggestedAge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suggested_age_params
      params.require(:suggested_age).permit(:name)
    end
end
