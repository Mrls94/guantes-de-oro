class ReportsController < ApplicationController
  def index
    authorize! :index, current_user

    @ventas_money_data = get_money_data(:venta)
    @ventas_money_data_js = { labels: @ventas_money_data.keys, datasets: [label: 'Total Ventas en Peso Colombiano', data: @ventas_money_data.values]}
    @ventas_count_data = get_count_data(:venta)
    @ventas_count_data_js = { labels: @ventas_count_data.keys, datasets: [label: 'Total Ventas hechas', data: @ventas_count_data.values]}
    
    @compras_money_data = get_money_data(:compra)
    @compras_money_data_js = { labels: @compras_money_data.keys, datasets: [label: 'Total Compras en Peso Colombiano', data: @compras_money_data.values]}
    @compras_count_data = get_count_data(:compra)
    @compras_count_data_js = { labels: @compras_count_data.keys, datasets: [label: 'Total Compras hechas', data: @compras_count_data.values]}
  end

  private

  def get_money_data(type)
    user_hash = {}
    daily_movements.where(action: type).group_by(&:user_id).each do |user_id, dms|
      user_email = User.find(user_id).email
      user_hash[user_email] = dms.pluck(:value_colombia).reduce(:+)
    end

    user_hash
  end

  def get_count_data(type)
    user_hash = {}
    daily_movements.where(action: type).group_by(&:user_id).each do |user_id, dms|
      user_email = User.find(user_id).email
      user_hash[user_email] = dms.count
    end
    user_hash
  end

  def daily_movements
    @daily_movements ||= DailyMovement.where('created_at BETWEEN ? AND ?', start_date, end_date)
  end

  def start_date
    7.days.ago.beginning_of_day
  end

  def end_date
    Time.zone.now.end_of_day
  end
end
