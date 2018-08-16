class SalesOrderDetailsController < ApplicationController
  before_action :set_sales_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /sales_order_details
  # GET /sales_order_details.json
  def index
    @sales_order_details = SalesOrderDetail.all
  end

  # GET /sales_order_details/1
  # GET /sales_order_details/1.json
  def show
  end

  # GET /sales_order_details/new
  def new
    @sales_order_detail = SalesOrderDetail.new
  end

  # GET /sales_order_details/1/edit
  def edit
  end

  # POST /sales_order_details
  # POST /sales_order_details.json
  def create
    @sales_order_detail = SalesOrderDetail.new(sales_order_detail_params)

    respond_to do |format|
      if @sales_order_detail.save
        format.html { redirect_to @sales_order_detail, notice: 'Sales order detail was successfully created.' }
        format.json { render :show, status: :created, location: @sales_order_detail }
      else
        format.html { render :new }
        format.json { render json: @sales_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_order_details/1
  # PATCH/PUT /sales_order_details/1.json
  def update
    respond_to do |format|
      if @sales_order_detail.update(sales_order_detail_params)
        format.html { redirect_to @sales_order_detail, notice: 'Sales order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @sales_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_order_details/1
  # DELETE /sales_order_details/1.json
  def destroy
    @sales_order_detail.destroy
    respond_to do |format|
      format.html { redirect_to sales_order_details_url, notice: 'Sales order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order_detail
      @sales_order_detail = SalesOrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_order_detail_params
      params.require(:sales_order_detail).permit(:sales_order_id, :product_id, :quantity, :unit_price, :subtotal)
    end
end
