class PurchaseOrderDetailsController < ApplicationController
  before_action :set_purchase_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /purchase_order_details
  # GET /purchase_order_details.json
  def index
    @purchase_order_details = PurchaseOrderDetail.all
  end

  # GET /purchase_order_details/1
  # GET /purchase_order_details/1.json
  def show
  end

  # GET /purchase_order_details/new
  def new
    @purchase_order_detail = PurchaseOrderDetail.new
  end

  # GET /purchase_order_details/1/edit
  def edit
  end

  # POST /purchase_order_details
  # POST /purchase_order_details.json
  def create
    @purchase_order_detail = PurchaseOrderDetail.new(purchase_order_detail_params)

    respond_to do |format|
      if @purchase_order_detail.save
        format.html { redirect_to @purchase_order_detail, notice: 'Purchase order detail was successfully created.' }
        format.json { render :show, status: :created, location: @purchase_order_detail }
      else
        format.html { render :new }
        format.json { render json: @purchase_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_order_details/1
  # PATCH/PUT /purchase_order_details/1.json
  def update
    respond_to do |format|
      if @purchase_order_detail.update(purchase_order_detail_params)
        format.html { redirect_to @purchase_order_detail, notice: 'Purchase order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @purchase_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_details/1
  # DELETE /purchase_order_details/1.json
  def destroy
    @purchase_order_detail.destroy
    respond_to do |format|
      format.html { redirect_to purchase_order_details_url, notice: 'Purchase order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order_detail
      @purchase_order_detail = PurchaseOrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_detail_params
      params.require(:purchase_order_detail).permit(:purchase_order_id, :product_id, :quantity, :unit_price, :subtotal)
    end
end
