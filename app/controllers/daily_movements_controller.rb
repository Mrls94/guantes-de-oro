class DailyMovementsController < ApplicationController
  before_action :set_daily_movement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_session
  load_and_authorize_resource

  # GET /daily_movements
  # GET /daily_movements.json
  def index
    @daily_movements = if current_user.admin?
                         DailyMovement.order(created_at: :desc)
                       else
                         current_user.daily_movements.order(created_at: :desc)
                       end
  end

  # GET /daily_movements/1
  # GET /daily_movements/1.json
  def show
  end

  # GET /daily_movements/new
  def new
    @daily_movement = DailyMovement.new
    set_new_variables
  end

  # GET /daily_movements/1/edit
  def edit
  end

  # POST /daily_movements
  # POST /daily_movements.json
  def create
    @daily_movement = DailyMovement.new(daily_movement_params)
    @daily_movement.user = current_user
    @daily_movement.cashier = current_user.session.cashier
    @daily_movement.action = params[:daily_movement][:action].to_i

    respond_to do |format|
      ActiveRecord::Base.transaction do
        if @daily_movement.save
          @daily_movement.deduct_from_cashier
          format.html { redirect_to @daily_movement, notice: 'Movimiento Diario fue creado exitosamente' }
          format.json { render :show, status: :created, location: @daily_movement }
        else
          set_new_variables
          format.html { render :new }
          format.json { render json: @daily_movement.errors, status: :unprocessable_entity }
        end
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
      @daily_movement = current_user.daily_movements.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daily_movement_params
      params.require(:daily_movement).permit(:user_id, :currency_id, :value_foreign, :value_colombia, :exchange_rate)
    end

    def set_new_variables
      @default_currency = Currency.first

      Currency.all.each do |currency|
        current_user.session.cashier.currency_values.find_or_initialize_by(currency_id: currency.id).save
      end

      @currency_info = current_user.session.cashier.currency_values.map do |cv|
        daily_movement_compras = current_user.session.cashier.daily_movements.where("action = 0 AND currency_id = #{cv.currency.id} AND created_at > '#{Time.zone.now.beginning_of_day}'")

        compra_trm = if daily_movement_compras.any?
                       array = daily_movement_compras.pluck(:exchange_rate)
                       (array.reduce(:+) / array.size.to_f).ceil
                     else
                       'No se han hecho compras'
                     end
        {
          currency_id: cv.currency.id,
          currency_name: cv.currency.name,
          default_buy_rate: cv.currency.default_buy_rate,
          default_sale_rate: cv.currency.default_sale_rate,
          value: cv.value,
          compra_trm: compra_trm
        }
      end
    end
end
