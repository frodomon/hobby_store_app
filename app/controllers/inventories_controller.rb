class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.select("product_id, sum(quantity) as quantity").group("product_id")
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { 
          flash[:notice] = 'El lote de productos se creó satisfactoriamente.'
          redirect_to inventories_path
        }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { 
          flash[:notice] = 'El lote de productos se creó satisfactoriamente.'
          redirect_to inventories_path
        }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { 
        flash[:notice] = 'El lote de productos se creó satisfactoriamente.'
        redirect_to inventories_path
      }
      format.json { head :no_content }
    end
  end

  def product_detail
    product_id = params[:product_id]
    @inventories = Inventory.where("product_id = ? and quantity > 0",product_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:product_id, :quantity, :registration_date, :release_date, :warehouse_id)
    end
end
