class GameLinesController < ApplicationController
  before_action :set_game_line, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show ]
  load_and_authorize_resource

  # GET /game_lines
  # GET /game_lines.json
  def index
    @game_lines = GameLine.all
  end

  # GET /game_lines/1
  # GET /game_lines/1.json
  def show
  end

  # GET /game_lines/new
  def new
    @game_line = GameLine.new
  end

  # GET /game_lines/1/edit
  def edit
  end

  # POST /game_lines
  # POST /game_lines.json
  def create
    @game_line = GameLine.new(game_line_params)

    respond_to do |format|
      if @game_line.save
        format.html { 
          flash[:notice] = 'La línea de juego se creó satisfactoriamente.'
          redirect_to game_lines_path
        }
        format.json { render :show, status: :created, location: @game_line }
      else
        format.html { render :new }
        format.json { render json: @game_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_lines/1
  # PATCH/PUT /game_lines/1.json
  def update
    respond_to do |format|
      if @game_line.update(game_line_params)
        format.html { 
          flash[:notice] = 'La línea de juego se actualizó satisfactoriamente.'
          redirect_to game_lines_path
        }
        format.json { render :show, status: :ok, location: @game_line }
      else
        format.html { render :edit }
        format.json { render json: @game_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_lines/1
  # DELETE /game_lines/1.json
  def destroy
    @game_line.destroy
    respond_to do |format|
      format.html { 
        flash[:notice] = 'La línea de juego se eliminó satisfactoriamente.'
        redirect_to game_lines_path
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_line
      @game_line = GameLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_line_params
      params.require(:game_line).permit(:name)
    end
end
