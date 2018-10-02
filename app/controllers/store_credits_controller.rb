class StoreCreditsController < ApplicationController
  before_action :set_store_credit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /store_credits
  # GET /store_credits.json
  def index
    @store_credits = StoreCredit.all
  end

  # GET /store_credits/1
  # GET /store_credits/1.json
  def show
  end

  # GET /store_credits/new
  def new
    @store_credit = StoreCredit.new
  end

  # GET /store_credits/1/edit
  def edit
  end

  # POST /store_credits
  # POST /store_credits.json
  def create
    @store_credit = StoreCredit.new(store_credit_params)

    respond_to do |format|
      if @store_credit.save
        format.html { 
          flash[:notice] = 'El crédito en tienda se creó satisfactoriamente.'
          redirect_to store_credits_path
        }
        format.json { render :show, status: :created, location: @store_credit }
      else
        format.html { render :new }
        format.json { render json: @store_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store_credits/1
  # PATCH/PUT /store_credits/1.json
  def update
    respond_to do |format|
      if @store_credit.update(store_credit_params)
        format.html { 
          flash[:notice] = 'El crédito en tienda se actualizó satisfactoriamente.'
          redirect_to store_credits_path
        }
        format.json { render :show, status: :ok, location: @store_credit }
      else
        format.html { render :edit }
        format.json { render json: @store_credit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_credits/1
  # DELETE /store_credits/1.json
  def destroy
    @store_credit.destroy
    respond_to do |format|
      format.html { 
        flash[:notice] = 'El crédito en tienda se eliminó satisfactoriamente.'
        redirect_to store_credits_path
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_credit
      @store_credit = StoreCredit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_credit_params
      params.require(:store_credit).permit(:user_id, :ammount, :detail, :credit_date)
    end
end
