class DeliveryHoursController < ApplicationController
  before_action :set_delivery_hour, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /delivery_hours
  # GET /delivery_hours.json
  def index
    @delivery_hours = DeliveryHour.all
  end

  # GET /delivery_hours/1
  # GET /delivery_hours/1.json
  def show
  end

  # GET /delivery_hours/new
  def new
    @delivery_hour = DeliveryHour.new
  end

  # GET /delivery_hours/1/edit
  def edit
  end

  # POST /delivery_hours
  # POST /delivery_hours.json
  def create
    @delivery_hour = DeliveryHour.new(delivery_hour_params)

    respond_to do |format|
      if @delivery_hour.save
        format.html { redirect_to @delivery_hour, notice: 'Delivery hour was successfully created.' }
        format.json { render :show, status: :created, location: @delivery_hour }
      else
        format.html { render :new }
        format.json { render json: @delivery_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /delivery_hours/1
  # PATCH/PUT /delivery_hours/1.json
  def update
    respond_to do |format|
      if @delivery_hour.update(delivery_hour_params)
        format.html { redirect_to @delivery_hour, notice: 'Delivery hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @delivery_hour }
      else
        format.html { render :edit }
        format.json { render json: @delivery_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_hours/1
  # DELETE /delivery_hours/1.json
  def destroy
    @delivery_hour.destroy
    respond_to do |format|
      format.html { redirect_to delivery_hours_url, notice: 'Delivery hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delivery_hour
      @delivery_hour = DeliveryHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def delivery_hour_params
      params.require(:delivery_hour).permit(:name)
    end
end
