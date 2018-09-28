class GameStylesController < ApplicationController
  before_action :set_game_style, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /game_styles
  # GET /game_styles.json
  def index
    @game_styles = GameStyle.all
  end

  # GET /game_styles/1
  # GET /game_styles/1.json
  def show
  end

  # GET /game_styles/new
  def new
    @game_style = GameStyle.new
  end

  # GET /game_styles/1/edit
  def edit
  end

  # POST /game_styles
  # POST /game_styles.json
  def create
    @game_style = GameStyle.new(game_style_params)

    respond_to do |format|
      if @game_style.save
        format.html { redirect_to @game_style, notice: 'Game style was successfully created.' }
        format.json { render :show, status: :created, location: @game_style }
      else
        format.html { render :new }
        format.json { render json: @game_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_styles/1
  # PATCH/PUT /game_styles/1.json
  def update
    respond_to do |format|
      if @game_style.update(game_style_params)
        format.html { redirect_to @game_style, notice: 'Game style was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_style }
      else
        format.html { render :edit }
        format.json { render json: @game_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_styles/1
  # DELETE /game_styles/1.json
  def destroy
    @game_style.destroy
    respond_to do |format|
      format.html { redirect_to game_styles_url, notice: 'Game style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_style
      @game_style = GameStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_style_params
      params.require(:game_style).permit(:name)
    end
end
