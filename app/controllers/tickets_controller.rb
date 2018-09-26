class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket_details = @ticket.ticket_details
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.ticket_details.build
    @products = Product.all
    @today = Time.now.strftime("%Y-%m-%d")
  end

  # GET /tickets/1/edit
  def edit
    @products = Product.all
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.ticket_date = Time.now
    @ticket.user_id = current_user.id

    respond_to do |format|
      if @ticket.save
        update_warehouse
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_warehouse
    almacen = Inventory.where('quantity > 0').order('product_id, registration_date ASC')
    almacen.each do |alm|
      puts alm.product_id
      puts alm.quantity
    end
    ticket_details = @ticket.ticket_details
    puts ticket_details.length
    ticket_details.each do |tkt|
      puts tkt.product_id
      pedido = tkt.quantity
      almacen.each do |alm|
        if tkt.product_id == alm.product_id
          cantidad = alm.quantity
          if pedido > 0  
            if cantidad < pedido
              pedido -= cantidad
              cantidad = 0
            elsif cantidad == pedido
              pedido = 0
              cantidad = 0
            elsif cantidad > pedido
              cantidad -= pedido
              pedido = 0
            end
            alm.update(quantity: cantidad)
            puts alm.quantity
          end
        end
      end
    end 

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :client, :ticket_date, :ticket_number, :delivery_date, :delivery_method_id, :payment_method_id,:delivery_hour_id, :delivery_cost, :discount_coupon, :ammount, :delivery_address_line1, :delivery_address_line2,
        ticket_details_attributes: [:id, :ticket_id, :product_id, :quantity, :unit_price, :subtotal, :_destroy])
    end
end