class DailyMovementsController < ApplicationController
  before_action :set_daily_movement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_session
  load_and_authorize_resource

  # GET /daily_movements
  # GET /daily_movements.json
  def index
    @daily_movements = DailyMovement.all
  end

  # GET /daily_movements/1
  # GET /daily_movements/1.json
  def show
  end

  # GET /daily_movements/new
  def new
    @daily_movement = DailyMovement.new
  end

  # GET /daily_movements/1/edit
  def edit
  end

  # POST /daily_movements
  # POST /daily_movements.json
  def create
    @daily_movement = DailyMovement.new(daily_movement_params)
    @daily_movement.user = current_user

    respond_to do |format|
      if @daily_movement.save
        format.html { redirect_to @daily_movement, notice: 'Daily movement was successfully created.' }
        format.json { render :show, status: :created, location: @daily_movement }
      else
        format.html { render :new }
        format.json { render json: @daily_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_movements/1
  # PATCH/PUT /daily_movements/1.json
  def update
    respond_to do |format|
      if @daily_movement.update(daily_movement_params)
        format.html { redirect_to @daily_movement, notice: 'Daily movement was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_movement }
      else
        format.html { render :edit }
        format.json { render json: @daily_movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_movements/1
  # DELETE /daily_movements/1.json
  def destroy
    @daily_movement.destroy
    respond_to do |format|
      format.html { redirect_to daily_movements_url, notice: 'Daily movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_movement
      @daily_movement = DailyMovement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_movement_params
      params.require(:daily_movement).permit(:user_id, :currency_id, :action, :value_foreign, :value_colombia, :exchange_rate)
    end
end
