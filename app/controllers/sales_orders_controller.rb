class SalesOrdersController < ApplicationController
  before_action :set_sales_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /sales_orders
  # GET /sales_orders.json
  def index
    @sales_orders = SalesOrder.all
  end

  # GET /sales_orders/1
  # GET /sales_orders/1.json
  def show
    @sales_order_details = @sales_order.sales_order_details
  end

  # GET /sales_orders/new
  def new
    @sales_order = SalesOrder.new
    @sales_order.sales_order_details.build
    @products = Product.all
    @today = Time.now.strftime("%Y-%m-%d")
  end

  # GET /sales_orders/1/edit
  def edit
    @products = Product.all
  end

  # POST /sales_orders
  # POST /sales_orders.json
  def create
    @sales_order = SalesOrder.new(sales_order_params)
    @sales_order.order_date = Time.now
    @sales_order.user_id = current_user.id

    respond_to do |format|
      if @sales_order.save
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully created.' }
        format.json { render :show, status: :created, location: @sales_order }
      else
        format.html { render :new }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_orders/1
  # PATCH/PUT /sales_orders/1.json
  def update
    respond_to do |format|
      if @sales_order.update(sales_order_params)
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_order }
      else
        format.html { render :edit }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_orders/1
  # DELETE /sales_orders/1.json
  def destroy
    @sales_order.destroy
    respond_to do |format|
      format.html { redirect_to sales_orders_url, notice: 'Sales order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_order
      @sales_order = SalesOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_order_params
      params.require(:sales_order).permit(:user_id, :client, :order_number, :order_date, :delivery_date, :delivery_method_id, :delivery_hour_id, :delivery_cost, :discount_coupon, :ammount, :payment_method_id, :delivery_address_line1, :delivery_address_line2, :status,
        sales_order_details_attributes: [:id, :sales_order_id, :product_id, :quantity, :unit_price, :subtotal, :_destroy])
    end
end
