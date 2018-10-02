class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: [:show, :edit, :update, :destroy, :update_warehouse_from_purchase_order]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource
  # GET /purchase_orders
  # GET /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all
  end

  # GET /purchase_orders/1
  # GET /purchase_orders/1.json
  def show
    @purchase_order_details = @purchase_order.purchase_order_details
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.purchase_order_details.build
    @suppliers = Supplier.all
    @products = Product.all
    @today = Time.now.strftime("%Y-%m-%d")
  end

  # GET /purchase_orders/1/edit
  def edit
    @products = Product.all
    @suppliers = Supplier.all
  end

  # POST /purchase_orders
  # POST /purchase_orders.json
  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    @purchase_order.order_date = Time.now
    @purchase_order.user_id = current_user.id

    respond_to do |format|
      if @purchase_order.save
        format.html { 
          flash[:notice] = 'La orden de compra se creó satisfactoriamente.'
          redirect_to purchase_orders_path
        }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1
  # PATCH/PUT /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { 
          flash[:notice] = 'La orden de compra se actualizó satisfactoriamente.'
          redirect_to purchase_orders_path
        }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1
  # DELETE /purchase_orders/1.json
  def destroy
    @purchase_order.destroy
    respond_to do |format|
      format.html { 
        flash[:notice] = 'La orden de compra se eliminó satisfactoriamente.'
        redirect_to purchase_orders_path
      }
      format.json { head :no_content }
    end
  end


  def update_warehouse_from_purchase_order
    pod_details = @purchase_order.purchase_order_details
    today = Time.now
    wid=2
    
    pod_details.each do |pod|
      inv_params = Inventory.new
      inv_params.product_id = pod.product_id
      inv_params.quantity = pod.quantity
      inv_params.registration_date = today
      inv_params.release_date = today
      inv_params.warehouse_id = wid
      inv_params.save
    end
    redirect_to inventories_url
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_order_params
      params.require(:purchase_order).permit(:supplier_id, :order_number, :order_date, :delivery_date, :user_id, :ammount, :registered,
        purchase_order_details_attributes: [:id, :purchase_order_id, :product_id, :quantity, :unit_price, :subtotal, :_destroy])
    end
end


